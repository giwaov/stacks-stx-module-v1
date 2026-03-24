import { describe, it, expect } from "vitest";
import { Cl } from "@stacks/transactions";

describe("stx-module-v1", () => {
  it("should set owner", () => {
    const result = simnet.callPublicFn("ownable", "set-owner", [Cl.principal(wallet2)], deployer);
    expect(result.result).toBeOk(Cl.bool(true));
  });

  it("should reject non-owner", () => {
    const result = simnet.callPublicFn("ownable", "set-owner", [Cl.principal(wallet2)], wallet1);
    expect(result.result).toBeErr(Cl.uint(401));
  });
});
