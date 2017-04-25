Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d3234-0004uV-3X
 for ath10k@lists.infradead.org; Tue, 25 Apr 2017 15:06:43 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: need a simple device to work with ath10k (desktop PC running
 Linux)
Date: Tue, 25 Apr 2017 15:06:11 +0000
Message-ID: <874lxczfvg.fsf@kamboji.qca.qualcomm.com>
References: <CAHU_OaRSGiC1xr3bwVXvvGzDGw4Rq20t8dFy=6JmxAa1VHfwcg@mail.gmail.com>
In-Reply-To: <CAHU_OaRSGiC1xr3bwVXvvGzDGw4Rq20t8dFy=6JmxAa1VHfwcg@mail.gmail.com>	(Eitan
 Bar's message of "Sun, 23 Apr 2017 09:19:06 +0300")
Content-Language: en-US
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
To: Eitan Bar <eitan.bar@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Eitan Bar <eitan.bar@gmail.com> writes:

> I recently bought WUSB6100m dongle (Linksys), with the (naive) hope
> that since its chipset is QCA9377, it will be supported and I can do
> some work on it...
>
> However, when I tried using it - Linux didn't recognize it, and then
> (with a google search I should have done prior to ordering, hehe) - I
> found out that only PCI seems to be supported (?)

Erik is working on adding USB support to ath10k (iirc he uses that
dongle for testing) and he has a kernel tree on github which has all the
patches. Search the archives of this list for more info.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
