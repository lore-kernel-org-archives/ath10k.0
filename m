Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huhLz-0007M6-H0
 for ath10k@lists.infradead.org; Mon, 05 Aug 2019 18:05:04 +0000
Received: by mail-pf1-x442.google.com with SMTP id g2so40038482pfq.0
 for <ath10k@lists.infradead.org>; Mon, 05 Aug 2019 11:05:03 -0700 (PDT)
Date: Mon, 5 Aug 2019 11:06:33 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 0/3] ath10k: Clean up regulator and clock handling
Message-ID: <20190805180633.GB23928@tuxbook-pro>
References: <20190725174755.23432-1-bjorn.andersson@linaro.org>
 <196fa4aa63fd5135aead736396fe3f8c@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <196fa4aa63fd5135aead736396fe3f8c@codeaurora.org>
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
To: Govind Singh <govinds@codeaurora.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, linux-arm-msm@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

On Thu 25 Jul 23:52 PDT 2019, Govind Singh wrote:

> On 2019-07-25 23:17, Bjorn Andersson wrote:
> > The first patch in this series removes the regulator_set_voltage() of a
> > fixed
> > voltate, as fixed regulator constraints should be specified on a board
> > level
> > and on certain boards - such as the Lenovo Yoga C630 - the voltage
> > specified
> > for the 3.3V regulator is outside the given range.
> > 
> > The following two patches cleans up regulator and clock usage by using
> > the bulk
> > API provided by the two frameworks.
> > 
> > Bjorn Andersson (3):
> >   ath10k: snoc: skip regulator operations
> >   ath10k: Use standard regulator bulk API in snoc
> >   ath10k: Use standard bulk clock API in snoc
> > 
> >  drivers/net/wireless/ath/ath10k/snoc.c | 324 ++++---------------------
> >  drivers/net/wireless/ath/ath10k/snoc.h |  26 +-
> >  2 files changed, 48 insertions(+), 302 deletions(-)
> 
> Tested on 845 MTP and QCS404 platform with normal sanity and driver recover
> cases for proxy votes.
> 
> Tested-by: Govind Singh <govinds@codeaurora.org>
> Reviewed-by: Govind Singh <govinds@codeaurora.org>
> 

Thanks Govind!

Regards,
Bjorn

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
