Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMPpm-0002yU-Dg
 for ath10k@lists.infradead.org; Fri, 22 Jan 2016 00:44:14 +0000
Subject: Re: [PATCH 00/13] ath10k: implement push-pull tx model
References: <1453384006-31907-1-git-send-email-michal.kazior@tieto.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <56A17B49.7040703@candelatech.com>
Date: Thu, 21 Jan 2016 16:43:53 -0800
MIME-Version: 1.0
In-Reply-To: <1453384006-31907-1-git-send-email-michal.kazior@tieto.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On 01/21/2016 05:46 AM, Michal Kazior wrote:
> This adds support for the new logic where host
> tells firmware how many frames are queued for each
> station/tid and then firmware asks host to submit
> frames for given station/tid.

Just FYI, with your tree (including this patch-set),
the non-upstream 10.4.1-ish firmware that was giving me fits finally works,
at least enough to grab an IP address.

Thanks!
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
