Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8TDN-0005kZ-E1
 for ath10k@lists.infradead.org; Mon, 25 Mar 2019 17:16:51 +0000
Received: by mail-lj1-x244.google.com with SMTP id r24so7513032ljg.3
 for <ath10k@lists.infradead.org>; Mon, 25 Mar 2019 10:16:48 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170])
 by smtp.gmail.com with ESMTPSA id 7sm3881853lju.27.2019.03.25.10.16.44
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Mar 2019 10:16:44 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id z26so8488037lja.13
 for <ath10k@lists.infradead.org>; Mon, 25 Mar 2019 10:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190320044511.12172-1-govinds@codeaurora.org>
 <20190320044511.12172-2-govinds@codeaurora.org>
In-Reply-To: <20190320044511.12172-2-govinds@codeaurora.org>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 25 Mar 2019 10:16:32 -0700
Message-ID: <CA+ASDXOMt9=bHOp3UrVy7FaPjta_GA70YeQJM3ksFRyoXK=kGw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt: bindings: add dt entry for XO calibration
 support
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

On Tue, Mar 19, 2019 at 9:48 PM Govind Singh <govinds@codeaurora.org> wrote:
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> @@ -81,6 +81,7 @@ Optional properties:
>         Definition: Name of external front end module used. Some valid FEM names
>                     for example: "microsemi-lx5586", "sky85703-11"
>                     and "sky85803" etc.
> +- xo-cal-data: xo cal offset to be configured in xo trim register.

https://media.readthedocs.org/pdf/devicetree-specification/stable/devicetree-specification.pdf

"2.2.4 Properties
...
Nonstandard property names should specify a unique string prefix, such
as a stock ticker symbol, identifying the name of the company or
organization that defined the property. Examples:
  fsl,channel-fifo-len ibm,ppc-interrupt-server#s
  linux,network-index"

In other words, like most other custom properties in this file, you
should probably have a "qcom," prefix.

Brian

>  Example (to supply PCI based wifi block details):

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
