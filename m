Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeh1U-00007X-6h
 for ath10k@lists.infradead.org; Fri, 29 May 2020 15:34:18 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v13] ath10k: add LED and GPIO controlling support for
 various chipsets
References: <1523027875-5143-1-git-send-email-kvalo@codeaurora.org>
 <b23e65cf-4be7-72db-7955-32eae196953e@dd-wrt.com>
 <3608947.bSrYYtX6KI@bentobox> <3445075.COMLMNsY4U@bentobox>
Date: Fri, 29 May 2020 18:34:07 +0300
In-Reply-To: <3445075.COMLMNsY4U@bentobox> (Sven Eckelmann's message of "Mon, 
 25 May 2020 18:04:49 +0200")
Message-ID: <87k10usqkw.fsf@codeaurora.org>
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
To: Sven Eckelmann <sven@narfation.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Sebastian Gottschall <s.gottschall@dd-wrt.com>, John Crispin <john@phrozen.org>, Sebastian Gottschall <s.gottschall@newmedia-net.de>, openwrt-devel@lists.openwrt.org, Ansuel Smith <ansuelsmth@gmail.com>

Sven Eckelmann <sven@narfation.org> writes:

> On Monday, 25 May 2020 11:22:13 CEST Sven Eckelmann wrote:
> [...]
>> And it still can with this OpenWrt version. But it doesn't seem to happen with 
>> the most recent OpenWrt reboot-13353-gb1604b744b. But there are nearly 4000 
>> commits inbetween. So no idea what changed (just a timing thing or an actual 
>> fix - no idea).
>
> Seems like there is a fix which solves some lost interrupt problems for 
> IPQ40xx. Without this change, I see the reported problem. And with the patch, 
> it is gone. Or in commits:
>
> * creates timeout problems: 46b949a067e5 ("ipq40xx: enlarge PCIe BAR size")
> * works fine: 18e942b6c4e5 ("ipq40xx: fix pcie msi IRQ trigger level")
>
> If you look in the git logs [1], you can see that the working commit is a 
> child of the broken one. So at least from my point of view, my initial report 
> is no blocker anymore for Sebastian's patch (or Kalle's version of it).

Great. If the patch is good to take can someone rebase the latest
version and resubmit, please?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
