Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwE1T-0002xm-U7
 for ath10k@lists.infradead.org; Mon, 27 Jan 2020 23:42:32 +0000
Received: by mail-pj1-x1042.google.com with SMTP id gv17so178226pjb.1
 for <ath10k@lists.infradead.org>; Mon, 27 Jan 2020 15:42:27 -0800 (PST)
Date: Mon, 27 Jan 2020 15:42:23 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 0/2] ath10k: Enable QDSS clock on sm8150
Message-ID: <20200127234223.GA202699@yoga>
References: <20191223054855.3020665-1-bjorn.andersson@linaro.org>
 <20200127184037.3BFB620CC7@mail.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127184037.3BFB620CC7@mail.kernel.org>
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
To: Stephen Boyd <sboyd@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Andy Gross <agross@kernel.org>, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

On Mon 27 Jan 10:40 PST 2020, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2019-12-22 21:48:53)
> > On SM8150 the WiFi firmware depends on the QDSS clock ticking, or the system
> > will reset due to an NoC error. So this adds an optional clock to the ath10k
> > binding and makes sure it's enabled while the WiFi firmware needs it.
> 
> Hopefully this isn't a requirement in production firmware? Seems
> wasteful to keep the debug clk enabled in the field when nobody is
> debugging anything.
> 

I'm confused about this as well, but I'm told that it was fixed
post-8150.

Regards,
Bjorn

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
