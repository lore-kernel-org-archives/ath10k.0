Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x233.google.com ([2607:f8b0:400c:c01::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WL3Tt-0001CC-60
 for ath10k@lists.infradead.org; Wed, 05 Mar 2014 04:30:57 +0000
Received: by mail-ve0-f179.google.com with SMTP id db12so502260veb.38
 for <ath10k@lists.infradead.org>; Tue, 04 Mar 2014 20:30:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQ=StPP+7-uEcHFVrVur4cTmZf8Nrvv4dBVsL1_yfZLtVQ@mail.gmail.com>
References: <CAEFj9874KjsRfC1rK5X1wWpQ-1hCt44tOLj5q+adWWLUbuyE0g@mail.gmail.com>
 <CA+BoTQnS1veOHepWtAsM2HfdKAAgtAoHganHHKo1VyBEowyJ6A@mail.gmail.com>
 <CAEFj986yq_K3iu6K8mzvfPjYmuULEZEPuRDOua2iLFTRimkuFA@mail.gmail.com>
 <CALhHN=p+dyQsnbc4+sDjqoHysnak4Uq3KYEkyCT-BDXvHPszCw@mail.gmail.com>
 <CAEFj984xXPrLQu+pjt6jSyuYT-hn3uM8fLj1UmhhJfF7K_=taA@mail.gmail.com>
 <CA+BoTQ=Q86r4E-CaHCmmxrkQJcHH_ZeaB2-e534KOQvSOgMcjA@mail.gmail.com>
 <CAEFj9844cE+XcS4zTVD8hf4eVrk_v=8xisc7vUBzwsnzm-ARwg@mail.gmail.com>
 <CA+BoTQm6CROYAY6nH6_bJo=1McTG8_7Q7byg-Yf8Ci0Q4v6jMw@mail.gmail.com>
 <CAEFj9850K2V9jOV0D_tQHb57DJRZ7ZMD0_GovY+B_VPNxP=maQ@mail.gmail.com>
 <CA+BoTQ=StPP+7-uEcHFVrVur4cTmZf8Nrvv4dBVsL1_yfZLtVQ@mail.gmail.com>
Date: Wed, 5 Mar 2014 12:30:32 +0800
Message-ID: <CAEFj984amedSqr6E8JVuzgU2vMLkHbd9Gz7o1fN4iA3A5OnANQ@mail.gmail.com>
Subject: Re: Only Lowest Legacy Rate 6Mbps used by Adhoc Mode
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> Let me get one thing clear -- calling to sta_rc_update *without* your
> supp_rates implementation doesn't yield 6mbps tx rate drop?
Yes.

I investigate the issue a bit further by modifying the ibss.c and also mac.c

Case 1:
Create, Associate (Legacy Rate), Disassociate, Delete, Create,
Associate (HT Rate)
--- TxRate always stuck at 6Mbps

Case 2:
Create, Associate (Legacy Rate), Disassociate, Delete, Create,
Associate (Legacy Rate)
--- Rate control works with TxRate going out to 54Mbps even after
delete and associate back the STA.

Case 3:
Create, Associate (HT Rate)
--- TxRate always stuck at 6Mbps

So it seems that the rate control is not working in the FW whenever
you configure the HT mode for the adhoc mode.

Any idea how to solve this?

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
