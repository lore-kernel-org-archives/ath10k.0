Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVmDu-0000kc-Vw
 for ath10k@lists.infradead.org; Wed, 11 Mar 2015 19:23:19 +0000
Message-ID: <1426101761.1904.10.camel@sipsolutions.net>
Subject: Re: [PATCH RFC v2] ath10k: move code from parameter list into a
 function
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 11 Mar 2015 20:22:41 +0100
In-Reply-To: <20150311191526.GA24455@opentech.at>
References: <1426100519-20636-1-git-send-email-hofrat@osadl.org>
 <1426101010.1904.9.camel@sipsolutions.net>
 <20150311191526.GA24455@opentech.at>
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
To: Nicholas Mc Guire <der.herr@hofr.at>
Cc: Jeff Haran <Jeff.Haran@citrix.com>, Valdis.Kletnieks@vt.edu, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>, Nicholas Mc Guire <hofrat@osadl.org>, Pat Erley <pat-lkml@erley.org>, Bj??rn Mork <bjorn@mork.no>

On Wed, 2015-03-11 at 20:15 +0100, Nicholas Mc Guire wrote:

> I'm not into this long enough to say what is better and if the consensus
> is that this patch is no more readable than the original code
> and no more maintainable either, then it is not worth the effort.

Personally, I like the change, it might even make that function more
reusable etc., and it gets rid of the ({ ... }) expression syntax which
I always find a bit odd :)

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
