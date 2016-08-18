Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1baP7i-0005rX-KE
 for ath10k@lists.infradead.org; Thu, 18 Aug 2016 15:20:51 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: master-pending: ODEBUG: free active (active state 0) object type:
 timer_list hint: ath10k_htt_rx_ring_refill_retry+0x0/0x10
 [ath10k_core]
Date: Thu, 18 Aug 2016 15:20:22 +0000
Message-ID: <87zioayuh6.fsf@kamboji.qca.qualcomm.com>
References: <874m6i15ct.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <874m6i15ct.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Thu, 18 Aug 2016 15:09:24 +0000")
Content-Language: en-US
Content-ID: <26E5DC074E8A1F47932AB00D0FC721F3@qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

"Valo, Kalle" <kvalo@qca.qualcomm.com> writes:

> I was testing master-pending branch and saw these warnings when I was
> reloading ath10k. I have seen this two times out of two tests so seems
> to be easy to reproduce. I don't have time to investigate this more at
> this time but I'll post this anyway.

Forgot to mention that I don't see this on the master branch. So this is
most likely a regression with one of the ath10k patches in the pending
branch:

d2d3bf622cf3 ath10k: implement NAPI support
fafddb2940b7 [RESEND, v4] ath10k: Fix sending NULL/ Qos NULL data frames for QCA99X0 and later
bd14e9eb9d35 ath10k: silence firmware file probing warnings
1c889244e37d ath10k: fix spurious tx/rx during boot
44eb4f1a2a01 ath10k: add wmi command barrier utility
38ac2cde9174 ath10k: implement wmi echo event
f955f7b7e8bb ath10k: implement wmi echo command
d47d953e01f7 ath10k: add testmode support for 10.4 firmware
fece7cd6c567 ath10k: handle testmode events for 10.2 and 10.4 based firmware
be44f6c28da8 ath10k: move firmware_swap_code_seg_info to ath10k_fw_file
99bcad7a3ad8 ath10k: Remove driver log suggesting QCA9887 support is experimental
524d09c7e373 ath10k: fix get rx_status from htt context

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
