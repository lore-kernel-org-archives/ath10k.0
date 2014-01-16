Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x22d.google.com ([2a00:1450:4008:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W3jJr-0000Z9-AM
 for ath10k@lists.infradead.org; Thu, 16 Jan 2014 09:32:59 +0000
Received: by mail-bk0-f45.google.com with SMTP id v16so1087428bkz.4
 for <ath10k@lists.infradead.org>; Thu, 16 Jan 2014 01:32:37 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <877ga0uvip.fsf@kamboji.qca.qualcomm.com>
References: <1389863904-7159-1-git-send-email-yeohchunyeow@gmail.com>
 <877ga0uvip.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 16 Jan 2014 17:32:37 +0800
Message-ID: <CAEFj9864XNeSKQRfVuo+KAKr76DVFM574arTCLLCTN+otzktAQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: set the AP keepalive timer
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

> Heh, bad timing. Yesterday I implemented STA quick kickout and in that
> patch I set the same parameters as you did. I just used longer values to
> avoid inactivity timeouts triggering in the firmware. We have the same
> functionality in hostapd, so there's no need to use the one in firmware.
>
> I'll send my patch after lunch, please take a look at that and see if
> it's ok.
Ok, no problem.

I am annoying that immediately getting continuous
WMI_PEER_STA_KICKOUT_EVENTID message even though the STA is active
when tested with firmware 10.1.467-1.

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
