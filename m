Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x230.google.com ([2607:f8b0:400c:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZzgv-000141-S7
 for ath10k@lists.infradead.org; Fri, 03 Oct 2014 10:02:26 +0000
Received: by mail-vc0-f176.google.com with SMTP id hq11so434421vcb.7
 for <ath10k@lists.infradead.org>; Fri, 03 Oct 2014 03:02:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADxDmp50X2XnBjfk5qJKRH-n=1Cwagmjb_XyD+RJ4AgpPh-kjQ@mail.gmail.com>
References: <CADxDmp50X2XnBjfk5qJKRH-n=1Cwagmjb_XyD+RJ4AgpPh-kjQ@mail.gmail.com>
Date: Fri, 3 Oct 2014 18:02:02 +0800
Message-ID: <CAEFj985wmiPwnF7rM1qCcO2K3X2yC_onO0AAMfm=9ytwpChzgg@mail.gmail.com>
Subject: Re: Dynamic channel Access
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: Kamran Nishat <kamran.nishat@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

As far as I know, dynamic bandwidth operation is based on RTS/CTS
exchange on each 20MHz channel before deciding whether to use 20MHz,
40MHz or 80MHz channel access.

Did you able to capture the RTS or CTS when testing with ath10k?

-----
Chun-Yeow

On Fri, Oct 3, 2014 at 3:58 AM, Kamran Nishat <kamran.nishat@gmail.com> wrote:
> Hi,
> To deal with co-channel interference 802.11ac standard propose Dynamic
> channel access. It means if my AP is configured on 40MHz, but it sense
> only its primary 20Mhz channel is free then it will dynamically
> changes its channel width to 20MHz and starts sending.
>
> Is dynamic channel access implemented in Atheros based 802.11ac chips?
>
>
> Regards
> Kamran
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
