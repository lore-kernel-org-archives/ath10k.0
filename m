Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D710BC25B47
	for <ath10k@archiver.kernel.org>; Tue, 24 Oct 2023 20:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJB6+0qh8Z7C0TgV6yT51bVvoR0+d/fZfGnjO2qvP6Q=; b=fDUTM2lfchViKV
	S2PWeocxMubj6dpeWfdPKGCYUGB/eVcnLjCfO33TcGz0hrDPL9drM9hPln79QV7VUpf9Z/ZwZwRIt
	QFH0rXxWxFKCMY1e0T51168tvrvtjhy8xMU26gx8WGjUKUpSfy1WbklhuwtPkNFXGkn/aIK+8d73R
	QpORnCKiKJSgIm5DvF7DyZciW5R7uNTUkQaq2juEZeUMUtkc8/73VyeQ9Cz+N0zSvTJH4X3WMjwKh
	gEkVwlP7qIBz8F75kRffostlqf2UpHeBBALHtYsqFwpRGVqXmz00VvfREDXemI3Cd86Ti7m1eCgGt
	I8adEHdn4UfAP9xfwFFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvODC-00ApV4-0H;
	Tue, 24 Oct 2023 20:41:14 +0000
Received: from omta34.uswest2.a.cloudfilter.net ([35.89.44.33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvOD9-00ApUk-1U
	for ath10k@lists.infradead.org;
	Tue, 24 Oct 2023 20:41:12 +0000
Received: from eig-obgw-6007a.ext.cloudfilter.net ([10.0.30.247])
	by cmsmtp with ESMTPS
	id vJpRqSRXa8HtevOD8qbbKj; Tue, 24 Oct 2023 20:41:10 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id vOD7q7gzO5ZLUvOD7qCjHO; Tue, 24 Oct 2023 20:41:09 +0000
X-Authority-Analysis: v=2.4 cv=S57KfagP c=1 sm=1 tr=0 ts=65382be5
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=_mNlVl-r0hj7kTaC:21 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=wYkD_t78qR0A:10
 a=C7jph2E_ELmAI9JBdBgA:9 a=QEXdDO2ut3YA:10 a=N_l3Vs37sht3-TxgB6J7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CQP5gW2kw3OSZC7+TZyppFCRoVOXM08fLFfFCxJ9+MI=; b=ishhMPzXE+3dsqZ87wH+FzSB34
	A3csF5Pl3r+WKLpp8EnFONjsuqkSyVHj/zTnEF3kA9lGZMroDFbnWsDp+K2yRMMOUm8cS++Z0GcMX
	yavlkHLe12GXW4Tu4CJoRjQRoJu7SUmGFfzpvvknE5qa350TIVIE1huOxwO/KCJN0xrt21oRpRzbf
	pjincn71KKzg99zsgDIsVIO1XMyGcZmx8rDDQsvdAt0HpgT7xBQXgoc1MRT4qSX9ohzTbc6xRI2HW
	YJWmAqpPg+TGb45jREA2IAmqMVB+fEhjppeqpAxbf2VHsIeqdFb55/55WQ2GASMFYt+QfO76v/3pK
	mZqQVwVQ==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:53652 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qvOD6-002Lxr-20;
	Tue, 24 Oct 2023 15:41:08 -0500
Message-ID: <07e9bb04-f9fc-46d5-bfb9-a00a63a707c0@embeddedor.com>
Date: Tue, 24 Oct 2023 14:41:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC - is this a bug?] wifi: ath10k: Asking for some light on
 this, please :)
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
References: <626ae2e7-66f8-423b-b17f-e75c1a6d29b3@embeddedor.com>
 <26b15f4702cef17fe70b496a62f03735874bd16a.camel@sipsolutions.net>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <26b15f4702cef17fe70b496a62f03735874bd16a.camel@sipsolutions.net>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qvOD6-002Lxr-20
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10]) [187.162.21.192]:53652
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNlw4FUSYXKSoAVzxFjo/tolUnZ1kWJZgZbDOjRygx6UPYYEZlOQfppL4HyHWK6aX+WQAxs1wCpqsKiCy1WPKWr8CyDGzyHSMKHTe5FSQa4a6nWwmsDO
 G5fn6rZHHDk7U+znVXCVJDXPVx0V1eNWStJ6Oz6BAI0GdL/OMu7xO9Y0tY2hQzGZsqPMn35nqq5xDaMJ4CTu4RbhBrHVRClsYrA4mgt3QtSDqFYuJTJkQdo9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_134111_549027_C3DD7214 
X-CRM114-Status: GOOD (  16.21  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org



On 10/24/23 14:11, Johannes Berg wrote:
> On Tue, 2023-10-24 at 13:50 -0600, Gustavo A. R. Silva wrote:
>> Hi all,
>>
>> While working on tranforming one-element array `peer_chan_list` in
>> `struct wmi_tdls_peer_capabilities` into a flex-array member
>>
>> 7187 struct wmi_tdls_peer_capabilities {
>> ...
>> 7199         struct wmi_channel peer_chan_list[1];
>> 7200 } __packed;
>>
>> the following line caught my attention:
>>
>> ./drivers/net/wireless/ath/ath10k/wmi.c:
>> 8920         memset(skb->data, 0, sizeof(*cmd));
>>
>> Notice that before the flex-array transformation, we are zeroing 128
>> bytes in `skb->data` because `sizeof(*cmd) == 128`, see below:
> 
> 
>> So, my question is: do we really need to zero out those extra 24 bytes in
>> `skb->data`? or is it rather a bug in the original code?
>>
> 
> If we look a step further, I _think_ even that memset is unnecessary?

It seems we run into the same issue in the function below, even in the
case this `memset()` is unnecessary (which it seems it's not):

	8920         memset(skb->data, 0, sizeof(*cmd));

Notice that if `cap->peer_chan_len == 0` or `cap->peer_chan_len == 1`,
in the original code, we have `len == sizeof(*cmd) == 128`:

drivers/net/wireless/ath/ath10k/wmi.c:
8911         /* tdls peer update cmd has place holder for one channel*/
8912         chan_len = cap->peer_chan_len ? (cap->peer_chan_len - 1) : 0;
8913
8914         len = sizeof(*cmd) + chan_len * sizeof(*chan);
8915
8916         skb = ath10k_wmi_alloc_skb(ar, len);

> 
> 
> struct sk_buff *ath10k_wmi_alloc_skb(struct ath10k *ar, u32 len)
> {
>          struct sk_buff *skb;
>          u32 round_len = roundup(len, 4);
> 
>          skb = ath10k_htc_alloc_skb(ar, WMI_SKB_HEADROOM + round_len);
>          if (!skb)
>                  return NULL;
> 
>          skb_reserve(skb, WMI_SKB_HEADROOM);
>          if (!IS_ALIGNED((unsigned long)skb->data, 4))
>                  ath10k_warn(ar, "Unaligned WMI skb\n");
> 
>          skb_put(skb, round_len);

so `round_len == roundup(len, 4) == 128` at the moment of this
`memset()` call:

>          memset(skb->data, 0, round_len);

which take us back to the same problem, this time in the `memset()` above,
because after the flex-array transformation we would have:

--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -8905,13 +8905,10 @@ ath10k_wmi_10_4_gen_tdls_peer_update(struct ath10k *ar,
         struct wmi_channel *chan;
         struct sk_buff *skb;
         u32 peer_qos;
-       int len, chan_len;
+       size_t len;
         int i;

-       /* tdls peer update cmd has place holder for one channel*/
-       chan_len = cap->peer_chan_len ? (cap->peer_chan_len - 1) : 0;
-
-       len = sizeof(*cmd) + chan_len * sizeof(*chan);
+       len = struct_size(cmd, peer_capab.peer_chan_list, cap->peer_chan_len);

         skb = ath10k_wmi_alloc_skb(ar, len);
         if (!skb)

which makes `round_len == roundup(len, 4) == struct_size(cmd,...,...) == 104`
when `cap->peer_chan_len == 0`

> So shouldn't the outgoing skb be exactly the same?

It seems it's not.

> 
> Anyway, just looking at the code out of curiosity, I don't actually know
> anything about this driver :)
> 
> johannes

--
Gustavo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
