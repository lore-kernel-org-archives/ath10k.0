Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([144.76.43.152] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wdi2d-0003Hv-D2
 for ath10k@lists.infradead.org; Fri, 25 Apr 2014 15:27:56 +0000
Message-ID: <1398439632.4152.14.camel@jlt4.sipsolutions.net>
Subject: Re: [PATCH 1/2 V3] mac80211: add option to generate CCMP IVs only
 for mgmt frames
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 25 Apr 2014 17:27:12 +0200
In-Reply-To: <1397467642-23544-1-git-send-email-marek.kwaczynski@tieto.com>
 (sfid-20140414_112812_088705_2F071D07)
References: <1397467642-23544-1-git-send-email-marek.kwaczynski@tieto.com>
 (sfid-20140414_112812_088705_2F071D07)
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
To: Marek Kwaczynski <marek.kwaczynski@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Mon, 2014-04-14 at 11:27 +0200, Marek Kwaczynski wrote:
> Some chips can encrypt managment frames in HW, but
> require generated IV in the frame. Add a key flag
> that allows us to achieve this.

Applied.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
