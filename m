Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x231.google.com ([2607:f8b0:400c:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKlVM-0004Fc-3s
 for ath10k@lists.infradead.org; Tue, 04 Mar 2014 09:19:16 +0000
Received: by mail-ve0-f177.google.com with SMTP id sa20so5349415veb.36
 for <ath10k@lists.infradead.org>; Tue, 04 Mar 2014 01:18:54 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CALhHN=p+dyQsnbc4+sDjqoHysnak4Uq3KYEkyCT-BDXvHPszCw@mail.gmail.com>
References: <CAEFj9874KjsRfC1rK5X1wWpQ-1hCt44tOLj5q+adWWLUbuyE0g@mail.gmail.com>
 <CA+BoTQnS1veOHepWtAsM2HfdKAAgtAoHganHHKo1VyBEowyJ6A@mail.gmail.com>
 <CAEFj986yq_K3iu6K8mzvfPjYmuULEZEPuRDOua2iLFTRimkuFA@mail.gmail.com>
 <CALhHN=p+dyQsnbc4+sDjqoHysnak4Uq3KYEkyCT-BDXvHPszCw@mail.gmail.com>
Date: Tue, 4 Mar 2014 17:18:54 +0800
Message-ID: <CAEFj984xXPrLQu+pjt6jSyuYT-hn3uM8fLj1UmhhJfF7K_=taA@mail.gmail.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> You can try to set/force tx rate using iw:
>
> Eg. setup legacy 18Mbps
> iw wlanX set bitrates legacy-5 18 ht-mcs-5 vht-mcs-5
>
> Set nss=1
> iw wlanX set bitrates legacy-5 ht-mcs-5 vht-mcs-5 1:0-9
>
> And check using sniffer if that will work - I didn't check adhoc.
>

Yes, this work. I can even force the HT rate.
[  559.410000] ath10k: rx skb 86feec00 len 116 ht rate_idx 7 vht_nss 0
freq 5180 band 1 flag 0x200200 fcs-err 0
[  560.410000] ath10k: rx skb 86884900 len 116 ht rate_idx 7 vht_nss 0
freq 5180 band 1 flag 0x200200 fcs-err 0

Hmm, it seems that rate control is not working for adhoc. Where to
look for a fix?

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
