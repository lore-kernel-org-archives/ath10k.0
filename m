Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1frgZ8-0007qp-CU
 for ath10k@lists.infradead.org; Mon, 20 Aug 2018 09:33:39 +0000
Message-ID: <1534757602.6287.4.camel@sipsolutions.net>
Subject: Re: [PATCH 0/3] Add support for ftm responder configuration
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 20 Aug 2018 11:33:22 +0200
In-Reply-To: <cd1e8ef5693b81c6b5d25eae36a44fd3@codeaurora.org>
 (sfid-20180818_095014_905997_2F2749FC)
References: <1534293018-4930-1-git-send-email-pradeepc@codeaurora.org>
 <1534323867.3547.30.camel@sipsolutions.net>
 <4aaa3a6185dbd116ba5c1a2ce76b691f@codeaurora.org>
 <1534407150.3547.58.camel@sipsolutions.net>
 <cd1e8ef5693b81c6b5d25eae36a44fd3@codeaurora.org>
 (sfid-20180818_095014_905997_2F2749FC)
Mime-Version: 1.0
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Sat, 2018-08-18 at 00:50 -0700, Pradeep Kumar Chitrapu wrote:
> > 
> I will change the attribute to FLAG type, also add support for LCI/CIVIC 
> params and repost the patch.

Looking at Android (for unrelated reasons), I see that they have a
separate "enable FTM responder" command:

https://android.googlesource.com/platform/hardware/interfaces/+/master/wifi/1.0/IWifiRttController.hal#158

Is that something you've seen/worked with? If so, how does it match your
current approach where FTM responder has to be enabled from the start?

Or perhaps this API is independent of AP and starts its own AP? But it
doesn't have any setup for the SSID etc., only the channel, so not clear
how that'd work?

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
