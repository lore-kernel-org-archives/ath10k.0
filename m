Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9VDi-0001yj-QT
 for ath10k@lists.infradead.org; Mon, 08 Oct 2018 13:05:12 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: Update board-2.bin files in linux-firmware
References: <9f53fa8a-89cf-2736-7832-5e4707e25c75@hauke-m.de>
 <2297652.AArlnWO5DQ@debian64>
Date: Mon, 08 Oct 2018 16:04:56 +0300
In-Reply-To: <2297652.AArlnWO5DQ@debian64> (Christian Lamparter's message of
 "Fri, 28 Sep 2018 22:04:54 +0200")
Message-ID: <87sh1gd1xj.fsf@kamboji.qca.qualcomm.com>
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
To: Christian Lamparter <chunkeey@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, Robert Marko <robimarko@gmail.com>, ath10k@lists.infradead.org, Skorpy <skorpy@darmstadt.ccc.de>

Christian Lamparter <chunkeey@gmail.com> writes:

> Hello,
>
> On Friday, September 28, 2018 9:28:44 PM CEST Hauke Mehrtens wrote:
>> the ath10k-firmware repository already contains updated board-2.bin
>> files with support for more devices. Please also update the board-2.bin
>> files shipped in the linux-firmware repository as they are normally
>> taken by distributions.
>
> At this opportunity, I would kindly like to remind the maintainer that there
> are currently more pending boardfiles. It would be great if they all could be
> included in the next update as well:
>
> pending
> =======
>
>  * Netgear WAC510
>  - https://www.mail-archive.com/ath10k@lists.infradead.org/msg09186.html (IPQ4019)
>
>  * Netgear Orbi PRO SRK60
>  - https://www.mail-archive.com/ath10k@lists.infradead.org/msg09078.html (IPQ4019) 
>  - https://www.mail-archive.com/ath10k@lists.infradead.org/msg09079.html (QCA9984)
>
>  * ZyXEL WRE6606:
>  - https://www.mail-archive.com/ath10k@lists.infradead.org/msg08776.html (IPQ4019)
>
>  * ZyXEL NBG6617:
>  - http://lists.infradead.org/pipermail/ath10k/2018-May/011377.html (IPQ4019)
>
> And there is an update for the ASUS' RT-AC58U
>  - http://lists.infradead.org/pipermail/ath10k/2018-January/010770.html (IPQ4019)

Thanks for the list, this was helpful. I should have now added all of
these, but the exception ZyXEL WRE6606 for which I couldn't find the
actual board files.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
