Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zwvy5-0000ks-TM
 for ath10k@lists.infradead.org; Thu, 12 Nov 2015 17:47:31 +0000
Message-ID: <1447350423.2131.2.camel@sipsolutions.net>
Subject: Re: [PATCH] cfg80211: add VHT support for Mesh
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 12 Nov 2015 18:47:03 +0100
In-Reply-To: <1447349791-3849-1-git-send-email-poh@qca.qualcomm.com>
References: <1447349791-3849-1-git-send-email-poh@qca.qualcomm.com>
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
To: Peter Oh <poh@qca.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On Thu, 2015-11-12 at 09:36 -0800, Peter Oh wrote:
> Add NL80211_EXT_FEATURE_VHT_MESH flag to allow drivers
> to indicate support for VHT in Mesh mode.
> 
I'm confused. Why would it be needed? You haven't added any API or
anything where userspace would do something differently based on
whether or not it's supported? There's nothing checking the flag, so
where's the point?

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
