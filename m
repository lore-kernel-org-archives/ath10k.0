Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-f175.google.com ([209.85.213.175])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZcC0h-0001aO-Qf
 for ath10k@lists.infradead.org; Wed, 16 Sep 2015 12:40:28 +0000
Received: by igbni9 with SMTP id ni9so31205987igb.0
 for <ath10k@lists.infradead.org>; Wed, 16 Sep 2015 05:40:03 -0700 (PDT)
Date: Wed, 16 Sep 2015 08:39:37 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: [PATCH 3/3] ath10k: implement mesh support
Message-ID: <20150916123937.GB2051@localhost>
References: <1440673024-13696-1-git-send-email-me@bobcopeland.com>
 <1440673024-13696-4-git-send-email-me@bobcopeland.com>
 <CAKf6xpsaygeFJyX_LKH2r82P2Xvih1GGBTAspKtCsZbBcVO9Ug@mail.gmail.com>
 <20150829222531.GA8604@localhost>
 <CAEFj987gvasYnRq8tiFeQitbBmoXAr77hXU2cUW_TsH+viUn8g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEFj987gvasYnRq8tiFeQitbBmoXAr77hXU2cUW_TsH+viUn8g@mail.gmail.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Jason Andryuk <jandryuk@gmail.com>

On Mon, Aug 31, 2015 at 01:43:28AM +0800, Chun-Yeow Yeoh wrote:
> Hi, Bob
> 
> > Yes: you don't want to enable raw mode TX / RX decap in the normal
> > case because it's fairly inefficient compared to "native" wifi mode,
> > according to my understanding.  The latter doesn't support mesh framing
> > however.
> >
> 
> The native WiFi mode doesn't support mesh framing. Can you elaborate
> more on this?

Sorry, missed this before -- the 'nwifi' mode which is the normal
datapath for ath10k discards the QoS header and following mesh header
when transmitting, if I recall correctly.  I also had some issues with the
received frames when using nwifi RX decap with raw mode TX, but I don't
recall exactly the problem.  I can retest with these modes if you really
want the details.

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
