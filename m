Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x236.google.com ([2a00:1450:4010:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YteVJ-00021L-Lq
 for ath10k@lists.infradead.org; Sat, 16 May 2015 15:59:58 +0000
Received: by lagv1 with SMTP id v1so163337454lag.3
 for <ath10k@lists.infradead.org>; Sat, 16 May 2015 08:59:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAP7Qh-x2qHhNGsVjtU73WuvRo2L4No40z-jnMN=eZS-Wk+EQBg@mail.gmail.com>
References: <5555C551.5090508@posteo.org>
 <CA+BoTQmec+JqancO6Q5FWtAXN1iUo7TazLTipnmoynqndvdp7Q@mail.gmail.com>
 <CAP7Qh-zq6gT=0kPi29PrmntbysWVkLgJqfyzxk3WfrndmE7GHQ@mail.gmail.com>
 <CAJHYP3iSHYbqRqmb_MeXq199o71pDtANRuohKUaMUj5spR-ZCg@mail.gmail.com>
 <CAP7Qh-x2qHhNGsVjtU73WuvRo2L4No40z-jnMN=eZS-Wk+EQBg@mail.gmail.com>
Date: Sat, 16 May 2015 16:59:34 +0100
Message-ID: <CAP7Qh-wGhsemvyV0NkEXOziYodt2sUd2egCf+=Gwi3+pHmJ_qQ@mail.gmail.com>
Subject: Re: ath20k blocks other devices
From: Eduardo Costa <eu@ejcosta.info>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Fri, May 15, 2015 at 11:25 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
> Can you get some sniff logs and possibly wpa_supplicant verbose logs
> from, e.g. another linux-based client? At this point I don't have any
> data to draw conclusions from. Is the network encrypted? Can you try
> seeing if open network also yields the same behaviour?
>
> Logs/traces from ath10k client itself would be also helpful. You can
> read more about getting these here:
> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/debug#tracing

I have some info to share and help on analysis.

My setup:
Laptop w/Killer card - Clevo P751ZM [4.1.0-rc1-wl-ath+ (from kvallo fork)]
Laptop Lenovo T400 [3.13.0-52-generic]
Andoird phone Samsung G S3 [Cyanogen]

I'v collected a tcp dump on all 3 devices, wpa_supplicant on 2 laptops
and trace on P751ZM.
All this starting when the first one was not connected to my wireless
AP, then I connect it and wait until two other devices lose their
connection.

Find files on: https://www.dropbox.com/sh/tdjf1m06rdx610f/AADuxvtZVCysDANnyFK1NKNHa?dl=0

Let me know if additional help/info is needed.

Additionally, I'v tried with open network and the problem remains.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
