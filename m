Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1baiLK-0004dZ-W4
 for ath10k@lists.infradead.org; Fri, 19 Aug 2016 11:52:12 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: master-pending: ODEBUG: free active (active state 0) object type:
 timer_list hint: ath10k_htt_rx_ring_refill_retry+0x0/0x10
 [ath10k_core]
Date: Fri, 19 Aug 2016 11:51:45 +0000
Message-ID: <878tvtyo1b.fsf@kamboji.qca.qualcomm.com>
References: <874m6i15ct.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <874m6i15ct.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Thu, 18 Aug 2016 15:09:24 +0000")
Content-Language: en-US
Content-ID: <278F569FF03E8D419A694B09774508AF@qualcomm.com>
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
>
> [  256.946615] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
> [  257.135392] ath10k_pci 0000:02:00.0: qca988x hw2.0 target 0x4100016c chip_id 0x043202ff sub 0000:0000
> [  257.135397] ath10k_pci 0000:02:00.0: kconfig debug 1 debugfs 1 tracing 1 dfs 0 testmode 1
> [  257.135665] ath10k_pci 0000:02:00.0: firmware ver 10.2.4.70.54 api 5 features no-p2p,raw-mode,mfp crc32 9d340dd9
> [  257.193219] ath10k_pci 0000:02:00.0: board_file api 1 bmi_id N/A crc32 bebc7c08
> [  258.458099] ath10k_pci 0000:02:00.0: htt-ver 2.1 wmi-op 5 htt-op 2 cal otp max-sta 128 raw 0 hwcrypto 1
> [  258.602274] ath: EEPROM regdomain: 0x0
> [  258.602279] ath: EEPROM indicates default country code should be used
> [  258.602280] ath: doing EEPROM country->regdmn map search
> [  258.602283] ath: country maps to regdmn code: 0x3a
> [  258.602285] ath: Country alpha2 being used: US
> [  258.602287] ath: Regpair used: 0x3a
>
> [...]
>
> [  277.244673] ------------[ cut here ]------------
> [  277.244685] WARNING: CPU: 2 PID: 2162 at lib/debugobjects.c:263 debug_print_object+0x85/0xa0
> [  277.244707] ODEBUG: free active (active state 0) object type: timer_list hint: ath10k_htt_rx_ring_refill_retry+0x0/0x10 [ath10k_core]

I bisected this to:

[v2] ath10k: implement NAPI support

https://patchwork.kernel.org/patch/9240975/

I'll reply to that patch for more info.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
