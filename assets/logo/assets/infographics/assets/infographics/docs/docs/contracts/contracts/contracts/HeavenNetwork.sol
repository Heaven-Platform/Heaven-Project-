/**
*Submitted for verification at BscScan.com on 2025-11-12
*/ 

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20; 

// OpenZeppelin Contracts (last updated v5.0.0) (token/ERC20/IERC20.sol)


/**
* @dev Interface of the ERC-20 standard as defined in the ERC.
*/
interface IERC20 {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value); 

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value); 

    /**
     * @dev Returns the value of tokens in existence.
     */
    function totalSupply() external view returns (uint256); 

    /**
     * @dev Returns the value of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256); 

    /**
     * @dev Moves a `value` amount of tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 value) external returns (bool); 

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256); 

    /**
     * @dev Sets a `value` amount of tokens as the allowance of `spender` over the
     * caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 value) external returns (bool); 

    /**
     * @dev Moves a `value` amount of tokens from `from` to `to` using the
     * allowance mechanism. `value` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address from, address to, uint256 value) external returns (bool);
} 

// OpenZeppelin Contracts (last updated v5.0.1) (utils/Context.sol)


/**
* @dev Provides information about the current execution context, including the
* sender of the transaction and its data. While these are generally available
* via msg.sender and msg.data, they should not be accessed in such a direct
* manner, since when dealing with meta-transactions the account sending and
* paying for execution may not be the actual sender (as far as an application
* is concerned).
*
* This contract is only required for intermediate, library-like contracts.
*/
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    } 

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    } 

    function _contextSuffixLength() internal view virtual returns (uint256) {
        return 0;
    }
} 

// OpenZeppelin Contracts (last updated v5.0.0) (token/ERC20/extensions/IERC20Metadata.sol)



/**
* @dev Interface for the optional metadata functions from the ERC-20 standard.
*/
interface IERC20Metadata is IERC20 {
    /**
     * @dev Returns the name of the token.
     */
    function name() external view returns (string memory); 

    /**
     * @dev Returns the symbol of the token.
     */
    function symbol() external view returns (string memory); 

    /**
     * @dev Returns the decimals places of the token.
     */
    function decimals() external view returns (uint8);
} 

// OpenZeppelin Contracts (last updated v5.0.0) (access/Ownable.sol)



/**
* @dev Contract module which provides a basic access control mechanism, where
* there is an account (an owner) that can be granted exclusive access to
* specific functions.
*
* The initial owner is set to the address provided by the deployer. This can
* later be changed with {transferOwnership}.
*
* This module is used through inheritance. It will make available the modifier
* `onlyOwner`, which can be applied to your functions to restrict their use to
* the owner.
*/
abstract contract Ownable is Context {
    address private _owner; 

    /**
     * @dev The caller account is not authorized to perform an operation.
     */
    error OwnableUnauthorizedAccount(address account); 

    /**
     * @dev The owner is not a valid owner account. (eg. `address(0)`)
     */
    error OwnableInvalidOwner(address owner); 

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner); 

    /**
     * @dev Initializes the contract setting the address provided by the deployer as the initial owner.
     */
    constructor(address initialOwner) {
        if (initialOwner == address(0)) {
            revert OwnableInvalidOwner(address(0));
        }
        _transferOwnership(initialOwner);
    } 

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        _checkOwner();
        _;
    } 

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    } 

    /**
     * @dev Throws if the sender is not the owner.
     */
    function _checkOwner() internal view virtual {
        if (owner() != _msgSender()) {
            revert OwnableUnauthorizedAccount(_msgSender());
        }
    } 

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby disabling any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    } 

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        if (newOwner == address(0)) {
            revert OwnableInvalidOwner(address(0));
        }
        _transferOwnership(newOwner);
    } 

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Internal function without access restriction.
     */
    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}



contract HeavenMLM is Context, Ownable { 

    event Registration(
        uint64 indexed id,
        address indexed caller,
        address indexed referrer,
        uint256 registerAmount
    );
    
    event Upgrade(
        uint64 indexed id,
        address indexed caller,
        uint256 upgradeAmount
    );
    
    event Renew(
        uint64 indexed id,
        Milestone milestone,
        uint256 renewalAmount
    );
    
    event ChangedAccount(
        uint64 indexed id,
        address indexed oldAccount,
        address indexed newAccount,
        uint256 paymentAmount
    ); 

    event RenewalFailed(uint64 indexed id, string reason, bytes errordata); 

    event ReceivedReward(uint64 indexed id, RewardInfo RI); 

    event TriggerReward(uint64 indexed id, uint256 amount, bool isGift); 

    event GiftReward(uint64 indexed id, address indexed giftReceiver); 

    enum Milestone {
        Unregistered,
        Register,
        Pioneer,
        Ambitious,
        Diligent,
        Racer,
        Leader,
        TopLeader,
        Angel,
        Creator
    } 

    struct Marketer {
        Milestone milestone; 

        bool isGiftReceiver;
        bool hasTriggeredGift;
        bool hasReceivedGift; 

        uint64 referrer;
        address account; 

        uint64 left;
        uint64 right; 

        uint64 height;
        uint64 downline; 

        uint256 registerDate;
        uint256 maxPoint;
        
        uint256 points;
        uint256 redeemedPoints;
        uint256 activePoints; 

        uint256 triggerReward; 

        uint256 USDreward;
        uint256 HVNreward;
    } 

    struct RewardInfo {
        bool isGiftReceiver;
        bool isHVNreceiver;
        bool isUSDreceiver;
        bool renewalPaid; 

        uint256 pointValue;
        uint256 paidValue;
        uint256 redeemable;
        uint256 redeemed;
        
        uint256 renewalAmount; 

        uint256 HVNamount;
        uint256 USDamount;
    } 

    mapping(address => bool) private _partners; 

    mapping(address => uint64) private _ids;
    mapping(uint64 => Marketer) private _marketers; 

    uint64 private counter = 1;
    uint64 private upgrades; 

    address private admin; 

    IERC20Metadata private HVN;
    IERC20Metadata private USD; 

    address private HeavenDAO;
    address private HeavenGM; 

    uint256 private _registrationFee = 50 ether;
    uint256 private _maxPoint = 10; 

    uint256 private _totalPendingPoints;
    uint256 private _totalActivePoints; 

    uint256 private _totalPayments;
    uint256 private _totalTopPerformersReward; 

    uint256 private _totalHVNrewards;
    uint256 private _totalUSDrewards; 

    uint256 private _totalTriggerRewards;
    uint256 private _totalGiftTriggerRewards;
    
    uint256 private _totalGiftRewards; 

    uint256 private _giftIndex; 

    uint64[] private giftReceivers; 

    string private _readMe; 

    constructor(address _admin) Ownable(_admin) {
        _partners[_admin] = true; 

        _marketers[0].registerDate = block.timestamp;
        _marketers[0].left = 1;
    } 

    function transferPayment(uint256 amount) public {
        address payer = _msgSender(); 

        if (USD.balanceOf(payer) < amount) {
            revert("Not Enough USD Balance");
        } 

        if (USD.allowance(payer, address(this)) < amount) {
            revert("Not Enough USD Allowance");
        } 

        USD.transferFrom(payer, address(this), amount); 

        distributePayment(amount);
    } 

    function receiveReward(uint64 id) public returns(RewardInfo memory RI) {
        if (id == 0 || id >= counter) revert("Invalid ID"); 

        RI = updateMarketer(id); 

        Marketer storage m = _marketers[id]; 

        RI.isUSDreceiver = m.points > m.redeemedPoints;
        uint256 max = m.maxPoint; 

        RI.pointValue = getPointValue(max == 7); 

        bool canReceive = RI.renewalAmount == 0 ? true : RI.renewalPaid; 

        if (RI.isUSDreceiver && RI.pointValue != 0 && canReceive) {
            RI.redeemable = m.points - m.redeemedPoints;
            
            if (RI.redeemable > max) {
                RI.redeemed = max;
            }
            else {
                RI.redeemed = RI.redeemable;
            } 

            m.redeemedPoints = m.points;
            m.activePoints += RI.redeemed; 

            RI.paidValue = RI.pointValue; 

            if (m.activePoints > 128) {
                uint256 val = RI.pointValue / 20; 

                RI.paidValue = val * 19;
                USD.transfer(HeavenDAO, val * RI.redeemed);
            } 

            RI.USDamount = RI.paidValue * RI.redeemed; 

            m.USDreward += RI.USDamount;
            _totalUSDrewards += RI.USDamount; 

            USD.transfer(m.account, RI.USDamount); 

            _totalActivePoints += (RI.redeemed);
            _totalPendingPoints -= (RI.redeemable - RI.redeemed) * 2;
        }
        
        emit ReceivedReward(id, RI);
    } 

    function distributeRewards(uint64[] memory ids) public returns(RewardInfo[] memory RIs) {
        uint256 len = ids.length;
        address caller = _msgSender(); 

        if (!_partners[caller]) {
            if (len == numberOfMarketers() || len >= 100) {
                uint64 id = _ids[caller];
                Marketer storage m = _marketers[id];
                
                if (m.account == address(0)) {
                    revert("Invalid Marketer");
                } 

                uint256 triggerShare = getUSDbalance() / 100;
                
                if (m.triggerReward + triggerShare > toUSD(20)) triggerShare = toUSD(20) - m.triggerReward; 

                m.triggerReward += triggerShare;
                USD.transfer(caller, triggerShare); 

                _totalTriggerRewards += triggerShare;
                emit TriggerReward(id, triggerShare, false);
            }
        }
        
        uint256 currentBal = getUSDbalance();
        RIs = new RewardInfo[](len); 

        uint64 prevId = ids[0] + 1; 

        for (uint i = 0; i < ids.length; ++i) {
            if (prevId <= ids[i]) revert("Invalid Order");
            prevId = ids[i];
            RIs[i] = receiveReward(prevId);
        } 

        if (currentBal == getUSDbalance()) revert("No Active Points");
    } 

    function register(address referrer) external {
        address caller = _msgSender(); 

        uint64 callerId = counter;
        uint64 refId = _ids[referrer]; 

        Marketer storage marketer = _marketers[callerId];
        Marketer storage ref = _marketers[refId]; 

        if (_ids[caller] != 0) revert("Marketer Exists");
        if (ref.registerDate == 0) revert("Invalid Referrer"); 

        uint64 vertPos = ref.height;
        _totalPendingPoints += vertPos; 

        if (ref.left == 0) {
            ref.left = callerId;
        }
        else if (ref.right == 0) {
            ref.right = callerId;
        }
        else revert("Referrer Full"); 

        marketer.milestone = Milestone.Register;
        marketer.referrer = refId;
        marketer.account = caller;
        marketer.height = vertPos + 1;
        marketer.maxPoint = 5; 

        if (!_partners[caller]) {
            transferPayment(_registrationFee);
        } 

        uint256 HVNamount = toHVN(500);
        if (payHVN(caller, HVNamount)) {
            marketer.HVNreward = HVNamount;
        } 

        _ids[caller] = callerId;
        marketer.registerDate = block.timestamp; 

        counter = callerId + 1; 

        emit Registration(callerId, caller, referrer, _registrationFee);
    } 

    function upgrade() external {
        address caller = _msgSender(); 

        uint64 callerId = _ids[caller]; 

        Marketer storage marketer = _marketers[callerId]; 

        if (callerId == 0) revert("Invalid Marketer");
        if (marketer.maxPoint == 7) revert("Already Upgraded"); 

        uint256 upgradeFee = _registrationFee * 2; 

        transferPayment(upgradeFee); 

        uint256 HVNamount = toHVN(500);
        if (payHVN(caller, HVNamount)) {
            marketer.HVNreward += HVNamount;
        } 

        marketer.maxPoint = 7; 

        unchecked {
            ++upgrades;
        } 

        emit Upgrade(callerId, caller, upgradeFee);
    } 

    function changeAccount(address newAccount) external {
        address caller = _msgSender();
        uint64 callerId = _ids[caller]; 

        Marketer storage marketer = _marketers[callerId]; 

        if (newAccount == address(0)) revert("Null Address");
        if (marketer.account == address(0)) revert("Invalid Marketer");
        if (_ids[newAccount] != 0) revert("New Account Exists"); 

        uint256 paymentAmount = _registrationFee / 10; 

        transferPayment(paymentAmount); 

        marketer.account = newAccount;
        _ids[newAccount] = callerId; 

        _ids[caller] = 0; 

        emit ChangedAccount(callerId, caller, newAccount, paymentAmount);
    } 

    function distributeAllRewards() external returns(RewardInfo[] memory RIs) {        
        uint64 num = numberOfMarketers();
        uint64[] memory allIds = new uint64[](num); 

        for (uint64 i = 0; i < num;) {
            allIds[i] = num - i;
            unchecked { ++i; }
        }
        
        return distributeRewards(allIds);
    } 

    function distributeGifts() external returns(uint256 giftable) {
        address caller = _msgSender();
        address giftM = HeavenGM; 

        if (!_partners[caller]) {
            uint64 id = _ids[caller];
            Marketer storage m = _marketers[id]; 

            if (m.account == address(0)) {
                revert("Invalid Marketer");
            } 

            if (m.hasTriggeredGift) {
                revert("Has Triggered");
            } 

            m.hasTriggeredGift = true; 

            uint256 amount = toUSD(2);
            USD.transferFrom(giftM, caller, amount); 

            _totalGiftTriggerRewards += amount;
            emit TriggerReward(id, amount, true);
        } 

        uint256 remaining = giftReceivers.length - _giftIndex; 

        if (remaining == 0) revert("No New Gifts"); 

        uint256 giftAmount = toUSD(10);
        giftable = USD.balanceOf(giftM) / giftAmount; 

        if (giftable == 0) revert("Insufficient Gift Balance"); 

        if (remaining < giftable) giftable = remaining; 

        _totalGiftRewards += (giftAmount * giftable); 

        uint256 i = _giftIndex;
        _giftIndex += giftable; 

        for (i; i < _giftIndex; ++i) {
            uint64 receiverId = giftReceivers[i];
            Marketer storage m = _marketers[receiverId]; 

            m.hasReceivedGift = true; 

            USD.transferFrom(
                giftM,
                m.account,
                giftAmount
            ); 

            emit GiftReward(receiverId, m.account);
        }
    } 

    function distributeTopPerformers(address topPerformer, uint256 rewardAmount) external onlyOwner returns(bool success) {
        success = payHVN(topPerformer, rewardAmount); 

        if (success) {
            _totalTopPerformersReward += rewardAmount; 

            if (_totalTopPerformersReward > toHVN(18_000_000)) {
                revert("Limit Reached");
            }
        }
    } 

    function changeReadMe(string memory newReadMe) external onlyOwner {
        _readMe = newReadMe;
    } 

    function setRegistrationFee(uint256 newFee) external onlyOwner {
        _registrationFee = newFee;
    } 

    function setMaxPoint(uint256 newMaxPoint) external onlyOwner {
        if (newMaxPoint < 8) revert("Too Low");
        _maxPoint = newMaxPoint;
    } 

    function setContracts(
        address _HVN,
        address _USD,
        address _HeavenDAO,
        address _HeavenGM,
        address _admin
    ) external onlyOwner {
        HVN = IERC20Metadata(_HVN);
        USD = IERC20Metadata(_USD); 

        HeavenDAO = _HeavenDAO;
        HeavenGM = _HeavenGM; 

        admin = _admin;
    } 

    function setPartners(address[] memory accounts, bool[] memory partners) external onlyOwner {
        for (uint i = 0; i < accounts.length; ++i) {
            _partners[accounts[i]] = partners[i];
        }
    } 

    function approveDAO(
        address token,
        uint256 amount
    ) 
        external 
        onlyOwner 
    {
        IERC20(token).approve(HeavenDAO, amount);
    }
    
    function getUSDbalance() public view returns(uint256) {
        return USD.balanceOf(address(this));
    } 

    function getPointValue(bool _hasUpgraded) public view returns(uint256) {
        uint256 currentActivePoints = (_totalPendingPoints / 2) - _totalActivePoints; 

        if (currentActivePoints == 0) return 0; 

        uint256 value = getUSDbalance() / currentActivePoints;
        uint256 max = toUSD(_hasUpgraded ? (_maxPoint * 150) / 100 : _maxPoint); 

        if (value > max) return max;
        return value;
    } 

    function getId(address account) public view returns(uint64) {
        return _ids[account];
    } 

    function numberOfMarketers() public view returns(uint64) {
        return counter - 1;
    } 

    function numberOfUpgrades() public view returns(uint64) {
        return upgrades;
    } 

    function name() external pure returns(string memory) {
        return "Heaven Multi-Level Marketing";
    }
    
    function readMe() external view returns (string memory) {
        return _readMe;
    } 

    function registerTutorial() external view returns(address USDcontract, string memory spender, uint256 amount, string memory tutorial) {
        bytes20 value = bytes20(address(this));
        bytes16 hexSymbols = "0123456789abcdef"; 

        bytes memory str = new bytes(42);
        str[0] = '0';
        str[1] = 'x'; 

        for (uint256 i = 0; i < 20; ++i) {
            str[2 + i * 2] = hexSymbols[uint8(value[i] >> 4)];
            str[3 + i * 2] = hexSymbols[uint8(value[i] & 0x0f)];
        } 

        return(
            address(USD),
            string(str),
            type(uint256).max,
            "Click on the USD contract link and open the verified 'Contract' section. There you will have to open the 'Write Contract' form and connect your wallet. Then open the 'approve' function tab and input the spender and amount given above. After completion, you can proceed using the 'register' function in this page."
        );
    } 

    function getUSDbalanceWithoutDecimal() external view returns(uint256) {
        return USD.balanceOf(address(this)) / toUSD(1);
    } 

    function getGiftIndex() external view returns(uint256) {
        return _giftIndex;
    } 

    function getGiftReceiver(uint256 index) external view returns(uint64) {
        return giftReceivers[index];
    } 

    function getGiftReceivers() external view returns(uint64[] memory) {
        return giftReceivers;
    } 

    function getTotalPoints()
        external
        view
        returns(uint256 totalPendingPoints, uint256 totalActivePoints, uint256 totalRedeemed)
    {
        return (_totalPendingPoints, _totalPendingPoints / 2, _totalActivePoints);
    } 

    function getTotalPayments()
        external
        view
        returns(uint256)
    {
        return _totalPayments;
    } 

    function getTotalPaidRewards()
        external
        view
        returns(uint256 HVNtopPerformers, uint256 HVNrewards, uint256 USDrewards, uint256 TotalTriggerRewards, uint256 TotalGiftTriggerRewards, uint256 TotalGiftRewards)
    {
        return (_totalTopPerformersReward, _totalHVNrewards, _totalUSDrewards, _totalTriggerRewards, _totalGiftTriggerRewards, _totalGiftRewards);
    } 

    function getMyMarketer() external view returns(Marketer memory m) {
        uint64 id = getId(_msgSender());
        if (id == 0) return m;
        return _marketers[id];
    } 

    function getMarketer(uint64 id) external view returns(Marketer memory m) {
        if (id == 0) return m;
        return _marketers[id];
    } 

    function hasUpgraded(uint64 id) external view returns(bool) {
        return _marketers[id].maxPoint == 7;
    } 

    function getContracts()
        external
        view
        returns(
            address _HVN,
            address _USD,
            address _HeavenDAO,
            address _HeavenGM,
            address _admin
        )
    {
        return (
            address(HVN),
            address(USD),
            HeavenDAO,
            HeavenGM,
            admin
        );
    } 

    function getFees()
        external
        view
        returns(uint256 RegistrationFee, uint256 UpgradeFee, uint256 RenewFee, uint256 ChangeAccountFee)
    {
        return (_registrationFee, _registrationFee, _registrationFee, _registrationFee / 10);
    } 

    function getMaxPoint() external view returns (uint256 NormalMaxPoint, uint256 UpgradedMaxPoint) {
        return (_maxPoint, (_maxPoint * 150) / 100);
    } 

    function arePartners(address[] memory accounts) external view onlyOwner returns(bool[] memory partners) {
        uint256 accountLength = accounts.length;
        partners = new bool[](accountLength); 

        for (uint i = 0; i < accountLength; ++i) {
            partners[i] = _partners[accounts[i]];
        }
    } 

    function getAllMarketers(
        uint256 start,
        uint256 end
    )
        external
        view
        onlyOwner
        returns (
            uint64[] memory ids,
            Marketer[] memory marketers
        )
    {
        if (end == 0 || end > counter) end = counter;
        require(end > start, "Invalid range"); 

        uint256 len = end - start;
        ids = new uint64[](len);
        marketers = new Marketer[](len); 

        for (uint256 i = start; i < end; ++i) {
            uint256 idx = i - start;
            ids[idx] = uint64(i);
            marketers[idx] = _marketers[uint64(i)];
        }
    } 

    function distributePayment(uint256 amount) internal {
        uint256 share = amount / 100; 

        USD.transfer(HeavenDAO, share * 34);
        USD.transfer(HeavenGM, share * 6);
        USD.transfer(admin, share * 4); 

        _totalPayments += share * 56;
    } 

    function payHVN(address to, uint256 amount) internal returns(bool) {
        if (HVN.balanceOf(address(this)) >= amount) {
            _totalHVNrewards += amount;
            return HVN.transfer(to, amount);
        }
        return false;
    } 

    function updateMarketer(uint64 id) internal returns(RewardInfo memory RI) {
        Marketer storage marketer = _marketers[id]; 

        uint64 leftDown = _marketers[marketer.left].downline;
        uint64 rightDown = _marketers[marketer.right].downline; 

        if (marketer.left != 0) {
            marketer.downline = 1 + leftDown;
        } 

        if (marketer.right != 0) {
            marketer.downline += 1 + rightDown;
            marketer.points = leftDown < rightDown ? leftDown + 1 : rightDown + 1;
        } 

        RI = checkHVNreward(id);
        RI.isGiftReceiver = checkGiftReceiver(id);
    } 

    function checkHVNreward(uint64 id) internal returns(RewardInfo memory RI) {
        Marketer storage m = _marketers[id]; 

        Milestone milestone = m.milestone; 

        bool checkRenewal = milestone >= Milestone.Racer; 

        bool payReward;
        Milestone target; 

        uint64 downline = m.downline;
        uint256 points = m.activePoints; 

        if (milestone == Milestone.Register) {
            payReward = downline >= 2;
            RI.HVNamount = toHVN(300);
            target = Milestone.Pioneer;
        } 
        else if (milestone == Milestone.Pioneer) {
            payReward = downline >= 4;
            RI.HVNamount = toHVN(700);
            target = Milestone.Ambitious;
        } 
        else if (milestone == Milestone.Ambitious) {
            payReward = points >= 3;
            RI.HVNamount = toHVN(1000);
            target = Milestone.Diligent;
        } 
        else if (milestone == Milestone.Diligent) {
            payReward = points >= 50;
            RI.HVNamount = toHVN(1500);
            target = Milestone.Racer;
        } 
        else if (milestone == Milestone.Racer) {
            payReward = points >= 100;
            RI.HVNamount = toHVN(2500);
            target = Milestone.Leader;
        } 
        else if (milestone == Milestone.Leader) {
            payReward = points >= 200;
            RI.HVNamount = toHVN(3500);
            target = Milestone.TopLeader;
        } 
        else if (milestone == Milestone.TopLeader) {
            payReward = points >= 300;
            RI.HVNamount = toHVN(4500);
            target = Milestone.Angel;
        } 
        else if (milestone == Milestone.Angel) {
            payReward = points >= 500;
            RI.HVNamount = toHVN(5000);
            target = Milestone.Creator;
        } 

        if (payReward) {
            RI.isHVNreceiver = HVN.balanceOf(address(this)) >= RI.HVNamount;
            
            if (checkRenewal) {
                RI.renewalAmount = _registrationFee; 

                if (m.maxPoint == 7) RI.renewalAmount /= 2; 

                try USD.transferFrom(m.account, address(this), RI.renewalAmount) returns (bool transfered) {
                    if (transfered) {
                        distributePayment(RI.renewalAmount);
                        RI.renewalPaid = true; 

                        if (RI.isHVNreceiver) {
                            payHVN(m.account, RI.HVNamount);
                            m.HVNreward += RI.HVNamount;
                        } 

                        emit Renew(id, m.milestone, RI.renewalAmount); 

                        m.milestone = target;
                        
                        return RI;
                    }
                } catch Error(string memory reason) {
                    emit RenewalFailed(id, reason, "");
                } catch (bytes memory data) {
                    emit RenewalFailed(id, "", data);
                }
            } 

            if (RI.isHVNreceiver && !checkRenewal) {
                m.milestone = target;
                payHVN(m.account, RI.HVNamount);
                m.HVNreward += RI.HVNamount;
            }
        }
    } 

    function checkGiftReceiver(uint64 id) internal returns(bool success) {
        Marketer storage m = _marketers[id]; 

        if (!m.isGiftReceiver) {
            bool isG = m.downline < 5 && m.points == 0; 

            if (m.points > 4 || isG) {                
                if (m.registerDate + 60 days < block.timestamp) {
                    giftReceivers.push(id);
                    m.isGiftReceiver = true;
                    success = true;
                }
            }
        }
    } 

    function toUSD(uint256 amount) internal view returns(uint256) {
        return amount * (10 ** USD.decimals());
    } 

    function toHVN(uint256 amount) internal view returns(uint256) {
        return amount * (10 ** HVN.decimals());
    }
}
