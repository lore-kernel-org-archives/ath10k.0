Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x229.google.com ([2607:f8b0:400c:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKjni-0001Os-0c
 for ath10k@lists.infradead.org; Tue, 04 Mar 2014 07:30:06 +0000
Received: by mail-ve0-f169.google.com with SMTP id pa12so5177173veb.14
 for <ath10k@lists.infradead.org>; Mon, 03 Mar 2014 23:29:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQnS1veOHepWtAsM2HfdKAAgtAoHganHHKo1VyBEowyJ6A@mail.gmail.com>
References: <CAEFj9874KjsRfC1rK5X1wWpQ-1hCt44tOLj5q+adWWLUbuyE0g@mail.gmail.com>
 <CA+BoTQnS1veOHepWtAsM2HfdKAAgtAoHganHHKo1VyBEowyJ6A@mail.gmail.com>
Date: Tue, 4 Mar 2014 15:29:42 +0800
Message-ID: <CAEFj986yq_K3iu6K8mzvfPjYmuULEZEPuRDOua2iLFTRimkuFA@mail.gmail.com>
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> If you refer to what driver reports (via nl80211 to userspace) then
> this is expected. Current FW/HW isn't capable of reporting tx rate for
> each sent frame so ath10k always reports 6mbps.
>
> Or do you refer to what you see on a sniffer?
>

Nope. This is the rate captured by wireshark and also confirm with the
following:

[ 3807.810000] ath10k: rx skb 86c77480 len 116  rate_idx 0 vht_nss 0
freq 5180 band 1 flag 0x200000 fcs-err 0
[ 3808.810000] ath10k: rx skb 8735fc00 len 116  rate_idx 0 vht_nss 0
freq 5180 band 1 flag 0x200000 fcs-err 0
[ 3809.810000] ath10k: rx skb 8738b9c0 len 116  rate_idx 0 vht_nss 0
freq 5180 band 1 flag 0x200000 fcs-err 0

It seems that it always stuck at 6Mbps legacy rate. Any idea why?

-----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
