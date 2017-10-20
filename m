Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e5O5j-0003D0-Jm
 for ath10k@lists.infradead.org; Fri, 20 Oct 2017 03:35:25 +0000
From: Yingying Tang <yintang@qti.qualcomm.com>
Subject: RE: [PATCH V6 1/5] mac80211: Enable TDLS peer buffer STA feature
Date: Fri, 20 Oct 2017 03:34:55 +0000
Message-ID: <ad23308b0865465daeba02cd416e22cb@aptaiexm02b.ap.qualcomm.com>
References: <TDLS for ath10k patches V6>
 <1508133633-23214-1-git-send-email-yintang@qti.qualcomm.com>
 <1508133633-23214-2-git-send-email-yintang@qti.qualcomm.com>
 (sfid-20171016_075844_306502_036ED199)
 <1508322936.2674.19.camel@sipsolutions.net>
In-Reply-To: <1508322936.2674.19.camel@sipsolutions.net>
Content-Language: en-US
MIME-Version: 1.0
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
To: Johannes Berg <johannes@sipsolutions.net>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

Hi Johannes,

I have built and tested it, it can work

-----Original Message-----
From: Johannes Berg [mailto:johannes@sipsolutions.net] 
Sent: Wednesday, October 18, 2017 6:36 PM
To: Yingying Tang <yintang@qti.qualcomm.com>; ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH V6 1/5] mac80211: Enable TDLS peer buffer STA feature

On Mon, 2017-10-16 at 14:00 +0800, yintang@qti.qualcomm.com wrote:
> From: Yingying Tang <yintang@qti.qualcomm.com>
> 
> Enable TDLS peer buffer STA feature.
> Set extended capability bit to enable buffer STA when driver support 
> it.

It would help if you could (build) test your changes :-)

johannes
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
