Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:72ef::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fqDMz-0001Ax-Dp
 for ath10k@lists.infradead.org; Thu, 16 Aug 2018 08:11:04 +0000
Message-ID: <1534406982.3547.55.camel@sipsolutions.net>
Subject: Re: [PATCH 1/3] nl80211: add support to configure FTM responder
 functionality
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 16 Aug 2018 10:09:42 +0200
In-Reply-To: <15c381ce743aedca37f3eea67975f841@codeaurora.org>
References: <1534293018-4930-1-git-send-email-pradeepc@codeaurora.org>
 <1534293018-4930-2-git-send-email-pradeepc@codeaurora.org>
 <1534334948.3547.39.camel@sipsolutions.net>
 <15c381ce743aedca37f3eea67975f841@codeaurora.org>
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
To: pradeepc@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Wed, 2018-08-15 at 18:48 -0700, pradeepc@codeaurora.org wrote:
> 
> Using FLAG attribute may create uncertainty to userspace especially when 
> flag attribute
> is not set and the driver supports capability, instead of 
> assuming/relying on the default
> behavior of driver/firmware.

I don't think there should be any enabling it by default in firmware,
and as such I think that's just a (separate) driver bug - I'm not
convinced we should build the API with driver bugs in mind.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
