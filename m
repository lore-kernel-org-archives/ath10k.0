Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A73CC07545
	for <ath10k@archiver.kernel.org>; Tue, 24 Oct 2023 19:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rc4GhOwC+gHJGtqVg6AwgWaALHkmEGrGvS9k+cR13WA=; b=lgHg11FXfxTUXfNUwG8jfRs7U+
	fWq6w8jj5BGC+7VOmVJyFy6NQlRCFGe9RQvQAjQVi7F+yB3EYP8SrPZ/SRqqGQH5LO6mQ7CDxKXjU
	drEC9p1MphWiOByIv82CHexniB54BeiSVJ0ODBDHzB2laTps+dvAZ9fZu3ZFNXu/fY/ceutr9Rgp8
	vynABrr8yNxwwnf3UZbCMyqWXSbt9taY1hAsKHDcxl1eGqfPFg3n17ZDG5SY64h+6/XOvAh9lKaSX
	RjH8USwsSwMwwKAx0Rka97463ZL6hxPQoPlq8/w1esnjyutlPU4HBDim0WFwcOx/IPvGXTpegVsPn
	CdyvU9Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvNQH-00AmKm-23;
	Tue, 24 Oct 2023 19:50:41 +0000
Received: from omta038.useast.a.cloudfilter.net ([44.202.169.37])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvNQE-00AmKE-33
	for ath10k@lists.infradead.org;
	Tue, 24 Oct 2023 19:50:40 +0000
Received: from eig-obgw-5001a.ext.cloudfilter.net ([10.0.29.139])
	by cmsmtp with ESMTPS
	id vJntqkFePWcCIvNQCqt60q; Tue, 24 Oct 2023 19:50:36 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id vNQBqS6CoTbebvNQCqeRLB; Tue, 24 Oct 2023 19:50:36 +0000
X-Authority-Analysis: v=2.4 cv=E8LeGIRl c=1 sm=1 tr=0 ts=6538200c
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=_mNlVl-r0hj7kTaC:21 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=wYkD_t78qR0A:10
 a=uwMjjtW2jUbwP7mzfGYA:9 a=QEXdDO2ut3YA:10 a=N_l3Vs37sht3-TxgB6J7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:Cc:To:
	Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=g54kz6I2OxMrqzBsVAyW+xfzdHVn9xE3lpEyC5lhvJs=; b=OzZcSIgm+yEGFVLC3R0m8HijPQ
	lhLIjWcJvlYi/ttwdT02zDdt8r9JXRcveNlKlsLuW9I7KEx90YSSUkyBAJxIasNaoBw5eXEBqryHR
	TEfhawSfU7CSH/BkMqiMQyhXqNl3Fs58s+/XfkacYUo82q8kdpPPOM216HjPlf0GtmJqbFruaT5fA
	mznRgRxTTfbSlBfcUdwb5pu6XgiDLRHx80NEsNF0uQF9GT1UA8/CP4SAcN926YU7vwzs0IYOE5kaz
	qt6BR19MBBqj/VrGVPM93VlENWousMPGOcHUPdyW/6t60Vlk0T0YSHn9aFAImWY5q6MEKhderrafn
	iSBqr1TQ==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:48784 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qvNQB-001ZQp-1F;
	Tue, 24 Oct 2023 14:50:35 -0500
Message-ID: <626ae2e7-66f8-423b-b17f-e75c1a6d29b3@embeddedor.com>
Date: Tue, 24 Oct 2023 13:50:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [RFC - is this a bug?] wifi: ath10k: Asking for some light on this,
 please :)
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qvNQB-001ZQp-1F
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10]) [187.162.21.192]:48784
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIAp2Qokkvr9FUyhirAD1MI22spLp/dNGOQx7VxsG6BUo3j+1YHBSjMmgT7zkwKqx0/44WdGePu7an6j9uP3+14jjFLjYaZvS4zf6+wCGb45x5My4VhS
 csdE8HS2zdRh9oXWgOx2Y8DqD6yLWEbMxGJ73TFWcSR6OqHXTeC2/RmVJ/xrIW8c5HABdhX6Izfohlk6pEGypNIbst6yB8KP6WjxinAG5Rnz2IvHRTwYrQOa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_125039_106810_50A9E24C 
X-CRM114-Status: UNSURE (   4.20  )
X-CRM114-Notice: Please train this message.
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

Hi all,

While working on tranforming one-element array `peer_chan_list` in
`struct wmi_tdls_peer_capabilities` into a flex-array member

7187 struct wmi_tdls_peer_capabilities {
...
7199         struct wmi_channel peer_chan_list[1];
7200 } __packed;

the following line caught my attention:

./drivers/net/wireless/ath/ath10k/wmi.c:
8920         memset(skb->data, 0, sizeof(*cmd));

Notice that before the flex-array transformation, we are zeroing 128
bytes in `skb->data` because `sizeof(*cmd) == 128`, see below:

$ pahole -C wmi_10_4_tdls_peer_update_cmd drivers/net/wireless/ath/ath10k/wmi.o
struct wmi_10_4_tdls_peer_update_cmd {
	__le32                     vdev_id;              /*     0     4 */
	struct wmi_mac_addr        peer_macaddr;         /*     4     8 */
	__le32                     peer_state;           /*    12     4 */
	__le32                     reserved[4];          /*    16    16 */
	struct wmi_tdls_peer_capabilities peer_capab;    /*    32    96 */

	/* size: 128, cachelines: 2, members: 5 */
};

So, after the flex-array transformation (and the necessary adjustments
to a few other lines of code) we would be zeroing 104 bytes in
`skb->data` because `sizeof(*cmd) == 104`, see below:

$ pahole -C wmi_10_4_tdls_peer_update_cmd drivers/net/wireless/ath/ath10k/wmi.o
struct wmi_10_4_tdls_peer_update_cmd {
	__le32                     vdev_id;              /*     0     4 */
	struct wmi_mac_addr        peer_macaddr;         /*     4     8 */
	__le32                     peer_state;           /*    12     4 */
	__le32                     reserved[4];          /*    16    16 */
	struct wmi_tdls_peer_capabilities peer_capab;    /*    32    72 */

	/* size: 104, cachelines: 2, members: 5 */
	/* last cacheline: 40 bytes */
};

This difference arises because the size of the element type for the
`peer_chan_list` array, which is `sizeof(struct wmi_channel) == 24 `

$ pahole -C wmi_channel drivers/net/wireless/ath/ath10k/wmi.o
struct wmi_channel {
	__le32                     mhz;                  /*     0     4 */
	__le32                     band_center_freq1;    /*     4     4 */
	__le32                     band_center_freq2;    /*     8     4 */

[..]
                                                /*    20     4 */

	/* size: 24, cachelines: 1, members: 6 */
	/* last cacheline: 24 bytes */
};

is included in `sizeof(*cmd)` before the transformation.

So, my question is: do we really need to zero out those extra 24 bytes in
`skb->data`? or is it rather a bug in the original code?

Thanks!
--
Gustavo


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
