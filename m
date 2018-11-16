Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNY7P-0005fJ-LL
 for ath10k@lists.infradead.org; Fri, 16 Nov 2018 07:00:45 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: support PCIe enter L1 state
References: <1542163848-837-1-git-send-email-wgong@codeaurora.org>
 <20181115002836.GA71934@google.com>
 <c94346b26a6d4b11a045a176ca854051@aptaiexm02f.ap.qualcomm.com>
 <20181115184333.GA87504@google.com>
Date: Fri, 16 Nov 2018 09:00:27 +0200
In-Reply-To: <20181115184333.GA87504@google.com> (Brian Norris's message of
 "Thu, 15 Nov 2018 10:43:33 -0800")
Message-ID: <87va4x8q2c.fsf@codeaurora.org>
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
To: Brian Norris <briannorris@chromium.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Wen Gong <wgong@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>

Brian Norris <briannorris@chromium.org> writes:
> On Thu, Nov 15, 2018 at 06:38:25AM +0000, Wen Gong wrote:
>> > 
>> > Is there some reason L1 was disabled in the first place? Was it known to be
>> > unreliable?
>>
>> Hi Brian,
>> It is a BUG for power, and it is not considered this BUG before.
>> So this change will fix the bug.
>
> I understand that the existing behavior is suboptimal for power, but on
> the other hand, code that goes out of its way to *clear* the L1 flag
> doesn't just pop up out of nowhere. Somebody clearly wrote that! If it
> just meant "we didn't verify L1 at first", then maybe it's fine to
> enable it unconditionally and see what happens, but if it meant "we
> tried L1 on some old chip XXXX and it caused problems", then it would be
> nice to know what those problems were.
>
> Or maybe that is hard to figure out, given there's no public git history
> tracking the original code, and we just need to try it out.

Yeah, it seems L1 was disabled already on the first ath10k commit:

5e3dd157d7e70 (Kalle Valo                2013-06-12 20:52:10 +0300 2404)        pcie_config_flags &= ~PCIE_CONFIG_FLAG_ENABLE_L1;

I don't remember anymore why but my guess is that the proprietary driver
at the time didn't support it with QCA998X. Or maybe QCA988X doesn't
even support L1? Michal, do you remember?

Related to QCA988X supporting L1 state also the commit log is misleading
as it only talks QCA6174/QCA9377, and has been only tested on QCA6174,
but the actual change enables L1 on _all_ PCI and AHB devices. So this
patch needs a lot more testing so that we have confidence that no
existing setups break.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
