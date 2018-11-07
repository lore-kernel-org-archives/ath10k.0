Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKE3O-0000qh-74
 for ath10k@lists.infradead.org; Wed, 07 Nov 2018 02:58:51 +0000
Received: by mail-pl1-x644.google.com with SMTP id c13-v6so7166185plz.13
 for <ath10k@lists.infradead.org>; Tue, 06 Nov 2018 18:58:40 -0800 (PST)
Date: Tue, 6 Nov 2018 18:58:36 -0800
From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v3 1/3] dt: bindings: add missing dt properties for
 WCN3990 wifi node
Message-ID: <20181107025834.GA43723@google.com>
References: <1539172376-19269-1-git-send-email-govinds@codeaurora.org>
 <1539172376-19269-2-git-send-email-govinds@codeaurora.org>
 <153976208916.5275.15753381614937010537@swboyd.mtv.corp.google.com>
 <20181102184315.GA130458@google.com>
 <154143558212.88331.5337286842567829007@swboyd.mtv.corp.google.com>
 <20181107000655.GA53622@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181107000655.GA53622@google.com>
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
Cc: devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, robh+dt@kernel.org, andy.gross@linaro.org, linux-soc@vger.kernel.org

On Tue, Nov 06, 2018 at 04:07:01PM -0800, Brian Norris wrote:
> On Mon, Nov 05, 2018 at 08:33:02AM -0800, Stephen Boyd wrote:
> > And yes, from what you've told me here it would make sense to make the
> > WCN chip a subnode of this SoC node instead of a phandle connecting the
> > two.
> 
> I could begrudgingly agree with that.

...

> 
> 	wifi: wifi@18800000 {
> 		compatible = "qcom,sdm845-wifi";
> 		reg = <...>
> 		clocks = <...>
> 		vdd-0.8-cx-mx-supply = <...>
> 		... interrupts, etc. ...
> 
> 		rf { // I don't know what to call this node. Suggestions
> 		     // welcome.
> 			compatible = "qcom,wcn3990-wifi";
> 			vdd-1.8-xo-supply = <...>;
> 			vdd-1.3-rfa-supply = <...>;
> 			vdd-3.3-ch0-supply = <...>;
> 		};
> 	};

By the way...I realize one reason why I've been "begrudging" on this:
the single-node binding was already reviewed and merged upstream as of
v4.18:

ae316c4cbba2 dt: bindings: add bindings for wcn3990 wifi block

It seems like a lot of needless churn to rewrite the entire binding,
only to
 * make the usage of these regulators a little clearer and
 * possibly help distinguish different variants of WCN3990 usage (e.g.,
   on different SoCs) -- I don't even know how different "WCN3990" looks
   when used on something non-SDM845.

Even if the second bullet point is important, we could fix this by a
more judicious use of 'compatible', rather than inventing whole new
nodes.

Regards,
Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
