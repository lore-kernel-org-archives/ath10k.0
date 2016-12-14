Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x232.google.com ([2607:f8b0:400d:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cH2iI-0006M3-4y
 for ath10k@lists.infradead.org; Wed, 14 Dec 2016 06:06:50 +0000
Received: by mail-qk0-x232.google.com with SMTP id n21so9327545qka.3
 for <ath10k@lists.infradead.org>; Tue, 13 Dec 2016 22:06:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAJ-Vmo=iLryhOS--PPYCGa9pE2GovPDOXi6xoH22xFOYXXKNVA@mail.gmail.com>
References: <583DD564.8040704@cococorp.com>
 <20161201070908.GB11953@atheros-ThinkPad-T61>
 <58421FA2.2020004@cococorp.com> <20161203124358.GB31861@atheros-ThinkPad-T61>
 <20161203124600.GC31861@atheros-ThinkPad-T61> <5845B325.6060002@cococorp.com>
 <d8eb0ba5828d43dd83030247ba443b88@aphydexm01f.ap.qualcomm.com>
 <58472E7B.7090603@cococorp.com> <58504113.2080702@cococorp.com>
 <5850831D.7020206@cococorp.com>
 <ccf17009a52748c99accdaa005ea837a@NALASEXR01H.na.qualcomm.com>
 <CAAnMG+OmeataRKYRjOjtBXF_1-De-F4zWbUsWoYRhVu02NPrrw@mail.gmail.com>
 <CAJ-Vmo=iLryhOS--PPYCGa9pE2GovPDOXi6xoH22xFOYXXKNVA@mail.gmail.com>
From: Alexis Green <agreen@cococorp.com>
Date: Tue, 13 Dec 2016 22:06:27 -0800
Message-ID: <CAAnMG+MY=LhfJxxUVdfRNYUW-2R+EXdLm2o6yDcCH0T1brRVxw@mail.gmail.com>
Subject: Re: ath10k firmware crashes in mesh mode on QCA9880
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: Benjamin Morgan <bmorgan@cococorp.com>, "lede-dev@lists.infradead.org" <lede-dev@lists.infradead.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Mohammed Shafi Shajakhan <mohammed@codeaurora.org>, "Nagarajan,
 Ashok Raj" <arnagara@qti.qualcomm.com>, "Manoharan,
 Rajkumar" <rmanohar@qca.qualcomm.com>

Hi Adrian,

I have not done much testing of ath10k and ath9k devices in a single
encrypted mesh recently, but I have a memory of only having this issue
when communicating between ath10k devices.

Alexis

On Tue, Dec 13, 2016 at 9:53 PM, Adrian Chadd <adrian@freebsd.org> wrote:
> Hi!
>
> Hm! So is there a firmware bug if there are 11n only capable nodes in
> an 11s mesh?
>
>
>
> -adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
