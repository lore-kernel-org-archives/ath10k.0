Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:72ef::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2C3I-0007Y7-BZ
 for ath10k@lists.infradead.org; Wed, 11 Oct 2017 08:07:42 +0000
Message-ID: <1507709235.1998.17.camel@sipsolutions.net>
Subject: Re: Setting single rate in ath10k broken by "reject/clear user rate
 mask if not usable"
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 11 Oct 2017 10:07:15 +0200
In-Reply-To: <1507708948.1998.15.camel@sipsolutions.net>
References: <13895fa0-3685-dd2b-583d-2d6469d23cfe@candelatech.com>
 (sfid-20171010_225427_620459_2849A16B)
 <1507708948.1998.15.camel@sipsolutions.net>
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
To: Ben Greear <greearb@candelatech.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, kirtika@google.com, Johannes Berg <johannes.berg@intel.com>

On Wed, 2017-10-11 at 10:02 +0200, Johannes Berg wrote:

> Overall, this isn't very well defined for AP mode...

No, that's not really correct. It *is* well defined (set the rate for
all clients to the same fixed rate), but that definition isn't very
good because if that rate isn't a basic rate, clients can connect that
don't support this rate...

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
