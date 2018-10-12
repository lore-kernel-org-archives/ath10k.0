Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAyYk-0004Cp-F9
 for ath10k@lists.infradead.org; Fri, 12 Oct 2018 14:37:00 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [ath6kl:pending 15/15]
 drivers/net/wireless/ath/ath10k/wmi.c:2407:46: warning: cast to restricted
 __le32
References: <201810082133.J7pQIpGP%fengguang.wu@intel.com>
Date: Fri, 12 Oct 2018 17:36:44 +0300
In-Reply-To: <201810082133.J7pQIpGP%fengguang.wu@intel.com> (kbuild test
 robot's message of "Mon, 8 Oct 2018 21:49:35 +0800")
Message-ID: <87lg7344g3.fsf@kamboji.qca.qualcomm.com>
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
To: kbuild test robot <lkp@intel.com>
Cc: Balaji Pothunoori <bpothuno@codeaurora.org>, kbuild-all@01.org, ath10k@lists.infradead.org

kbuild test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
> head:   70aa9eaba2a46b3d53caf03060576a7615182814
> commit: 70aa9eaba2a46b3d53caf03060576a7615182814 [15/15] ath10k:
> management tx ack rssi capability check
> config: x86_64-allmodconfig (attached as .config)
> compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
> reproduce:
>         git checkout 70aa9eaba2a46b3d53caf03060576a7615182814
>         # save the attached .config to linux build tree
>         make ARCH=x86_64 
>
> All warnings (new ones prefixed by >>):
>
>>> drivers/net/wireless/ath/ath10k/wmi.c:2407:46: warning: cast to restricted __le32
>    drivers/net/wireless/ath/ath10k/wmi.c:2408:42: warning: cast to restricted __le32
> --
>>> drivers/net/wireless/ath/ath10k/wmi-tlv.c:744:26: warning:
>>> incorrect type in assignment (different base types)
>    drivers/net/wireless/ath/ath10k/wmi-tlv.c:744:26: expected
> restricted __le32 [usertype] num_reports
>    drivers/net/wireless/ath/ath10k/wmi-tlv.c:744:26: got unsigned int
> [unsigned] [usertype] <noident>

The warnings seem to be valid but it was not caused by patch "ath10k:
management tx ack rssi capability check". Instead they were added by:

[1/2] ath10k: Handle bundled tx completion for managenent frames

https://patchwork.kernel.org/patch/10623969/

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
