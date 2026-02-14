Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9388EF5852
	for <ath10k@archiver.kernel.org>; Sat, 14 Feb 2026 21:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsp8J2fI/v1p9J8sW2g6hOHwVvM3CyEW6vww6USeZ1o=; b=RA5C3HJabS4R+thJ0nRSzi2E0Z
	P1mu6f4vWRG4yYAAP0gfBC4NWDSaq7MC5c1zaMtqkd0bsHF9a+T2A4eUuFWcKKeAudI1qMjp2CoJ2
	4NLcFCHHYAwBExftVVXEx1UAlnrY13IBMmKm1JyDNHBUNOBQf2Q2TSrG/VLTSmvRC559aEfTxMJNQ
	AVyYnP9hZjI1t1nDDOF3MTYxKwpxNJVZDuJWJavacOh82ACWG5cDHh3cDaQYsqZ9QP94E9ixXMM87
	MnLf1PE3H8E3nLXkHkIjwiL/L5vy35udA789QQVTLpSMwoWrwhvzwSsPtkZJXfRsGHSCHDjuY5t/f
	ZiXOh0dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrN93-00000004wpy-1uho;
	Sat, 14 Feb 2026 21:25:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrN91-00000004wpc-2dh0
	for ath10k@lists.infradead.org;
	Sat, 14 Feb 2026 21:25:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 42A43402B2;
	Sat, 14 Feb 2026 21:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36753C16AAE;
	Sat, 14 Feb 2026 21:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771104339;
	bh=b1LD+Xansm2gIBycBh5imiPFd4gz7SExWM2XaWHP+zQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZHgKkXwfVIUJdlnWOFBjl5fb9J5W2iIGjXEJdCsdZDISFVZoCO2MsCZNT1lMAFa0o
	 71YSxfU2m7W0F+UPOq7C6h4ut7SCmz4bGKKLCwEKveHBdTqC5a3mUYi1PVDZTlu9dT
	 KmVjSKkm+QRq86g/97Ir8O+a+uzyQ5T73SgVn3+qbqaw1cWFzNEeNmGgoT0uevN6k6
	 pLT0dSIu/OIU8UjuN9m1qtNTDlAqBuAAUNb7uCbxgappzDgv7+HaLs2k4Kqr7jJ3vT
	 qFcH9MDtpzzqJka9/6EHs//F4ileZKajiBy69L735cA3yMq3p51+9HQVYsOX/VLN8M
	 rrtDNPxBDR8EA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Ziyi Guo <n7l8m4@u.northwestern.edu>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.19-5.10] wifi: ath10k: fix lock protection in ath10k_wmi_event_peer_sta_ps_state_chg()
Date: Sat, 14 Feb 2026 16:22:51 -0500
Message-ID: <20260214212452.782265-26-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214212452.782265-1-sashal@kernel.org>
References: <20260214212452.782265-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_132539_709515_A092944C 
X-CRM114-Status: GOOD (  19.83  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

From: Ziyi Guo <n7l8m4@u.northwestern.edu>

[ Upstream commit 820ba7dd6859ef8b1eaf6014897e7aa4756fc65d ]

ath10k_wmi_event_peer_sta_ps_state_chg() uses lockdep_assert_held() to
assert that ar->data_lock should be held by the caller, but neither
ath10k_wmi_10_2_op_rx() nor ath10k_wmi_10_4_op_rx() acquire this lock
before calling this function.

The field arsta->peer_ps_state is documented as protected by
ar->data_lock in core.h, and other accessors (ath10k_peer_ps_state_disable,
ath10k_dbg_sta_read_peer_ps_state) properly acquire this lock.

Add spin_lock_bh()/spin_unlock_bh() around the peer_ps_state update,
and remove the lockdep_assert_held() to be aligned with new locking,
following the pattern used by other WMI event handlers in the driver.

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Link: https://patch.msgid.link/20260123175611.767731-1-n7l8m4@u.northwestern.edu
[removed excess blank line]
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis of wifi: ath10k: fix lock protection in
ath10k_wmi_event_peer_sta_ps_state_chg()

### 1. Commit Message Analysis

The commit message is clear and well-structured:
- **Subject**: Explicitly says "fix lock protection" — this is a
  locking/synchronization bug fix
- **Body**: Explains that `lockdep_assert_held()` asserted
  `ar->data_lock` should be held by callers, but **no caller actually
  held it**. This means the assertion was always wrong (or always
  disabled), and the field `arsta->peer_ps_state` was being accessed
  without the required lock protection.
- **Reviewed-by**: Baochen Qiang from Qualcomm reviewed it, lending
  credibility
- The commit references that `core.h` documents `peer_ps_state` as
  protected by `ar->data_lock`, and other accessors properly acquire it
  — meaning this was the only broken path.

### 2. Code Change Analysis

The change is minimal and surgical:

1. **Removes** `lockdep_assert_held(&ar->data_lock)` — the callers never
   held this lock, so the assertion was incorrect (and likely only
   checked with CONFIG_LOCKDEP enabled, which is why it didn't always
   trigger)

2. **Adds** `spin_lock_bh(&ar->data_lock)` /
   `spin_unlock_bh(&ar->data_lock)` around the single line
   `arsta->peer_ps_state = __le32_to_cpu(ev->peer_ps_state)` — this is
   the actual fix, properly protecting the field with the documented
   lock

The lock scope is minimal — only around the single write to
`peer_ps_state`, placed after the RCU-protected station lookup and
before the RCU read unlock. This is clean and correct.

### 3. Bug Classification

This is a **data race / missing synchronization** bug:
- The field `peer_ps_state` is documented as requiring `ar->data_lock`
  protection
- Other readers/writers of this field properly acquire the lock
- This WMI event handler was the only path that didn't hold the lock
- Without the lock, concurrent reads (from
  `ath10k_dbg_sta_read_peer_ps_state`) and writes could race, leading to
  torn reads or inconsistent state

### 4. Scope and Risk Assessment

- **Lines changed**: ~4 lines effective (remove 2 lines, add 3 lines
  including lock/unlock)
- **Files changed**: 1 file (`drivers/net/wireless/ath/ath10k/wmi.c`)
- **Risk**: Very low. The change adds proper locking around a single
  field access, following the established pattern used by all other
  accessors. The lock is `spin_lock_bh`, which is safe in this softirq
  context.
- **Could it break something?** Extremely unlikely — it adds a lock that
  was already supposed to be held, and uses the same locking pattern as
  other paths in the driver.

### 5. User Impact

- **Affected hardware**: ath10k WiFi devices (Qualcomm 802.11ac chipsets
  — very common in laptops and embedded systems)
- **Trigger**: WMI peer power-save state change events from firmware
- **Consequence of bug**: Data race on `peer_ps_state` field. While this
  is a 32-bit field and the race may not always cause visible corruption
  on most architectures, it violates the documented locking contract and
  could cause issues with lockdep-enabled kernels (warnings/splats). On
  architectures without atomic 32-bit writes, it could cause torn reads.
- **Severity**: Medium — it's a real locking bug in a commonly-used WiFi
  driver

### 6. Stability Indicators

- Reviewed by Qualcomm engineer (Baochen Qiang)
- Accepted by the ath10k maintainer (Jeff Johnson)
- Small, obvious, and following established patterns in the same driver

### 7. Dependency Check

- No dependencies on other commits
- The code being modified has existed in ath10k for a long time (the
  `lockdep_assert_held` suggests the locking was always intended but
  never correctly implemented in this path)
- Should apply cleanly to any stable tree that has the ath10k driver
  with this function

### 8. Stable Kernel Criteria

- **Obviously correct?** Yes — adds the documented lock around a field
  access
- **Fixes a real bug?** Yes — data race / missing synchronization
- **Small and contained?** Yes — 4 lines in 1 file
- **No new features?** Correct — pure bug fix
- **Tested?** Reviewed by subsystem experts, accepted by maintainer

### Conclusion

This is a textbook stable-worthy fix: a small, surgical correction to a
locking bug in a widely-used WiFi driver. It properly adds the lock that
was always documented as required but never acquired in this code path.
The risk is minimal and the fix follows established patterns in the same
driver.

**YES**

 drivers/net/wireless/ath/ath10k/wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index b4aad6604d6d9..ce22141e5efd9 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -5289,8 +5289,6 @@ ath10k_wmi_event_peer_sta_ps_state_chg(struct ath10k *ar, struct sk_buff *skb)
 	struct ath10k_sta *arsta;
 	u8 peer_addr[ETH_ALEN];
 
-	lockdep_assert_held(&ar->data_lock);
-
 	ev = (struct wmi_peer_sta_ps_state_chg_event *)skb->data;
 	ether_addr_copy(peer_addr, ev->peer_macaddr.addr);
 
@@ -5305,7 +5303,9 @@ ath10k_wmi_event_peer_sta_ps_state_chg(struct ath10k *ar, struct sk_buff *skb)
 	}
 
 	arsta = (struct ath10k_sta *)sta->drv_priv;
+	spin_lock_bh(&ar->data_lock);
 	arsta->peer_ps_state = __le32_to_cpu(ev->peer_ps_state);
+	spin_unlock_bh(&ar->data_lock);
 
 exit:
 	rcu_read_unlock();
-- 
2.51.0


