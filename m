Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0079.hostedemail.com ([216.40.44.79]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPFuV-0006ru-8b
 for ath10k@lists.infradead.org; Thu, 26 Sep 2013 18:03:35 +0000
Message-ID: <1380218576.17366.76.camel@joe-AO722>
Subject: Re: [PATCH 00/11 - GIT PULL] drivers: net: Last block of Remove
 extern from function prototypes
From: Joe Perches <joe@perches.com>
Date: Thu, 26 Sep 2013 11:02:56 -0700
In-Reply-To: <20130926.134408.91633054642517467.davem@redhat.com>
References: <cover.1380137609.git.joe@perches.com>
 <20130926.134408.91633054642517467.davem@redhat.com>
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
To: David Miller <davem@redhat.com>
Cc: brcm80211-dev-list@broadcom.com, ath9k-devel@venema.h4ckr.net, wimax@linuxwimax.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

On Thu, 2013-09-26 at 13:44 -0400, David Miller wrote:
> From: Joe Perches <joe@perches.com>
> Date: Wed, 25 Sep 2013 12:37:18 -0700
[]
> Pulled, thanks Joe.
> That should be about it for networking right?

Yes for drivers/net/...

There are some more files like:

include/linux/etherdevice.h
include/linux/inetdevice.h
include/linux/net.h
include/linux/netdevice.h
include/linux/skbuff.h

and some netfilter ones:

include/linux/netfilter*.h
include/linux/netfilter/...

and maybe a few others like:

include/linux/atmdev.h
include/linux/fddidevice.h

that I was planning on converting then submitting.

Want those in one more pull request or
maybe individually?


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
