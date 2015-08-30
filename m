Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZW6dz-0004wz-C9
 for ath10k@lists.infradead.org; Sun, 30 Aug 2015 17:43:51 +0000
Received: by oibi18 with SMTP id i18so48192894oib.3
 for <ath10k@lists.infradead.org>; Sun, 30 Aug 2015 10:43:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150829222531.GA8604@localhost>
References: <1440673024-13696-1-git-send-email-me@bobcopeland.com>
 <1440673024-13696-4-git-send-email-me@bobcopeland.com>
 <CAKf6xpsaygeFJyX_LKH2r82P2Xvih1GGBTAspKtCsZbBcVO9Ug@mail.gmail.com>
 <20150829222531.GA8604@localhost>
Date: Mon, 31 Aug 2015 01:43:28 +0800
Message-ID: <CAEFj987gvasYnRq8tiFeQitbBmoXAr77hXU2cUW_TsH+viUn8g@mail.gmail.com>
Subject: Re: [PATCH 3/3] ath10k: implement mesh support
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
To: Bob Copeland <me@bobcopeland.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Jason Andryuk <jandryuk@gmail.com>

Hi, Bob

> Yes: you don't want to enable raw mode TX / RX decap in the normal
> case because it's fairly inefficient compared to "native" wifi mode,
> according to my understanding.  The latter doesn't support mesh framing
> however.
>

The native WiFi mode doesn't support mesh framing. Can you elaborate
more on this?

Thanks

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
