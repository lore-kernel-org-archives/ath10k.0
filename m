Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cduSj-0003PX-CF
 for ath10k@lists.infradead.org; Wed, 15 Feb 2017 07:57:19 +0000
Message-ID: <1487145412.4026.5.camel@sipsolutions.net>
Subject: Re: [PATCH v3 2/2] mac80211: store tx power value from user to station
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 15 Feb 2017 08:56:52 +0100
In-Reply-To: <1486555011-25143-1-git-send-email-arnagara@qti.qualcomm.com>
References: <1486555011-25143-1-git-send-email-arnagara@qti.qualcomm.com>
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
To: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>, linux-wireless@vger.kernel.org
Cc: arnagara@codeaurora.org, ath10k@lists.infradead.org


> + * @txpwr: indicates the tx power, in mBm, to be used when sending data frames
+ *	to the STA. Value of 0 means, automatic (default) tx power.

Similarly here, I'm not too sure about 0 meaning automatic.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
