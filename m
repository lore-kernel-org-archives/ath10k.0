Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:72ef::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e4lhi-0007BW-Nx
 for ath10k@lists.infradead.org; Wed, 18 Oct 2017 10:36:04 +0000
Message-ID: <1508322936.2674.19.camel@sipsolutions.net>
Subject: Re: [PATCH V6 1/5] mac80211: Enable TDLS peer buffer STA feature
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 18 Oct 2017 12:35:36 +0200
In-Reply-To: <1508133633-23214-2-git-send-email-yintang@qti.qualcomm.com>
 (sfid-20171016_075844_306502_036ED199)
References: <TDLS for ath10k patches V6>
 <1508133633-23214-1-git-send-email-yintang@qti.qualcomm.com>
 <1508133633-23214-2-git-send-email-yintang@qti.qualcomm.com>
 (sfid-20171016_075844_306502_036ED199)
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
To: yintang@qti.qualcomm.com, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On Mon, 2017-10-16 at 14:00 +0800, yintang@qti.qualcomm.com wrote:
> From: Yingying Tang <yintang@qti.qualcomm.com>
> 
> Enable TDLS peer buffer STA feature.
> Set extended capability bit to enable buffer STA when driver
> support it.

It would help if you could (build) test your changes :-)

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
