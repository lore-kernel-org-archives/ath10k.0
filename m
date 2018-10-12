Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt1-f193.google.com ([209.85.160.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAyi7-0000AK-NA
 for ath10k@lists.infradead.org; Fri, 12 Oct 2018 14:46:41 +0000
Received: by mail-qt1-f193.google.com with SMTP id c56-v6so14057972qtd.11
 for <ath10k@lists.infradead.org>; Fri, 12 Oct 2018 07:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <201810090804.eQbqAwdi%fengguang.wu@intel.com>
 <87pnwf44n6.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87pnwf44n6.fsf@kamboji.qca.qualcomm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 12 Oct 2018 16:46:10 +0200
Message-ID: <CAK8P3a2NaKwHwe3RE_wZN6=myd1dqtWC91EJahbbKuS2oZ+xXw@mail.gmail.com>
Subject: Re: [ath6kl:pending 10/15] ERROR: "__udivdi3"
 [drivers/net/wireless/ath/ath10k/ath10k_core.ko] undefined!
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: kbuild test robot <lkp@intel.com>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, pillair@codeaurora.org, kbuild-all@01.org, svishnoi@codeaurora.org

On Fri, Oct 12, 2018 at 4:32 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> + linux-wireless, arnd
>
> >
> >>> ERROR: "__udivdi3" [drivers/net/wireless/ath/ath10k/ath10k_core.ko] undefined!
> >>> ERROR: "__divdi3" [drivers/net/wireless/ath/ath10k/ath10k_core.ko] undefined!
>
> I'm not sure what this is about. The corresponding patch is here:
>
> https://patchwork.kernel.org/patch/10624567/
>
> I see some division in the patch but I can't immeaditely see what's
> wrong. So is this a problem in the bot, in parisc architecture or with
> the patch? Anyone have any good ideas? Arnd?
>

I think the problem is that 'clock_freq' is a 'u64', which means we can't use
a normal 32-bit division. It looks like it cannot actually go beyond the
range of a u32, so changing the type should be sufficient.

      Arnd

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
