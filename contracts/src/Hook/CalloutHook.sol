// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {BaseHook} from "v4-hooks-public/src/base/BaseHook.sol";
import {Currency} from "v4-hooks-public/lib/v4-core/src/types/Currency.sol";
import {PoolKey} from "v4-hooks-public/lib/v4-core/src/types/PoolKey.sol";
import {PoolId} from "v4-hooks-public/lib/v4-core/src/types/PoolId.sol";
import {BalanceDelta} from "v4-hooks-public/lib/v4-core/src/types/BalanceDelta.sol";
import {SwapParams, ModifyLiquidityParams} from "v4-hooks-public/lib/v4-core/src/types/PoolOperation.sol";
import {IPoolManager} from "v4-hooks-public/lib/v4-core/src/interfaces/IPoolManager.sol";
import {BeforeSwapDelta} from "v4-hooks-public/lib/v4-core/src/types/BeforeSwapDelta.sol";
import {Hooks} from "v4-hooks-public/lib/v4-core/src/libraries/Hooks.sol";

import "../Marketplace/MarketplaceFactory.sol";

contract CalloutHook is BaseHook {
    MarketplaceFactory private immutable marketplaceFactory;

    uint8 constant B = 1;

    constructor(
        IPoolManager _manager,
        address payable _marketplaceFactory
    ) BaseHook(_manager) {
        marketplaceFactory = MarketplaceFactory(_marketplaceFactory);
    }

    function _beforeAddLiquidity(address sender, PoolKey calldata key, ModifyLiquidityParams calldata params, bytes calldata hookData)
        internal
        override
        returns (bytes4)
    {
        // TODO: Implement __beforeAddLiquidity
    }

    function _beforeSwap(address sender, PoolKey calldata key, SwapParams calldata params, bytes calldata hookData)
        internal
        override
        returns (bytes4, BeforeSwapDelta, uint24)
    {
        // TODO: Implement __beforeSwap
    }


    function getHookPermissions()
        public
        pure
        override
        returns (Hooks.Permissions memory)
    {
        return
            Hooks.Permissions({
                beforeInitialize: false,
                afterInitialize: false,
                beforeAddLiquidity: true,
                beforeRemoveLiquidity: false,
                afterAddLiquidity: false,
                afterRemoveLiquidity: false,
                beforeSwap: true,
                afterSwap: false,
                beforeDonate: false,
                afterDonate: false,
                beforeSwapReturnDelta: true,
                afterSwapReturnDelta: false,
                afterAddLiquidityReturnDelta: false,
                afterRemoveLiquidityReturnDelta: false
            });
    }

}
