Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDC2606A324
	for <ath10k@archiver.kernel.org>; Tue,  3 Nov 2026 09:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eop8FgQD;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jR4khUt7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WNWl64We
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KUBbiIfZu+24bweR1re7NXjlbwlpg2p+g1Gnk+3cVK0=; b=eop8FgQDOKxCeO
	UGYubCLOq52YvVF868Y0FXwRp6I8WaIZn5lpOYp5RKud7pKfJPbz9TAK3KOMfD2MWijmBEEUXMyYc
	St5zBE6cydP0z8R1wJXubVMqeKjVE223CXuxBP/Iuboz4F+172G/pCGHeM6nJLs/vrEPggjB3MgL2
	gXD9f6mTn7ZUgyspgKhiVhiBwXIxaGF83ONxSp2BL3QUU5HXlwkqMx0l1Qe6Uu+zURIf0QLOoNvZl
	/ARytSsnMgCf0DmHDn9Z/aMQc540nJ32hwINMKb8SqyGZXtuZs1+rovwwmP9rP6a6QBqKFWUHUzV8
	FXYlOpvbCfTop8yfegkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAhO-00000001jLX-4AQf;
	Tue, 03 Nov 2026 09:20:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAhJ-00000001jLB-3iq0
	for ath10k@lists.infradead.org;
	Tue, 03 Nov 2026 09:20:57 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A387pXB2403073
	for <ath10k@lists.infradead.org>; Tue, 3 Nov 2026 09:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KUBbiIfZu+24bweR1re7NXjlbwlpg2p+g1Gnk+3cVK0=; b=jR4khUt7auVF2cTs
	+zE1das89MxlX4ly8zfcOrManLqiiQhL486a7PFc00bj1PPUpwccm31TQKNOoyHI
	AVAUs/O4hZ11F31TXS6ZRbJE8KN8pFS51HYtVDbtdJfaqI3Kx08A/17DodSlik5w
	vDpRIYy8JZNVfd++OdET2A0fnw7JxO9zAqlcntMsTT5N0ME5LkwebEcl4BmebNdg
	QDKiWkfzy5XMLuzZaz99k5Aqngvrm1nQBnwiVZsHHpx26CMr77kFgGp0Sz5PAQF3
	8g+YTwsflDwMKT79yPcRN6H9JEdVhcKtZCfPvRQ3BLu4A0Yq8TiuMIELtxMSL6Hs
	WFm76Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy24gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 03 Nov 2026 09:20:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f26dd2165so562753585a.3
        for <ath10k@lists.infradead.org>; Tue, 03 Nov 2026 01:20:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793697652; cv=none;
        d=google.com; s=arc-20260327;
        b=B0ha2/v9ohDo0ynwBPQfcvvkCa0TpzQzMKyBfoDff0myuSId5wVYtCq6KZrJXOhhUH
         rgp8xD+kSClI8o1x+GmwY/sTCvSqBKR7IubaNn9p1DxZmK5lZNhSpvpYt6OWE2DY1V09
         5ww3AuDAW1K3Z7SOoBD2Ky6N7BpuKjh9qzOMkzCVqt4Z410E7gA9H+FBdRNelwgoPD5G
         GKcuOK5uY4fBuRWIYakFfJ3ZiUr4T4AZxyRtWZIAHCPPApXiS8iaGPaTFRpw3zRS9PZA
         SgBM5v/NsZ5848/OzEdaqdtVp23gx0fZ4B3OeDDw/yK/4uCKq45srgUB9rIQoMJkyvZr
         gsUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KUBbiIfZu+24bweR1re7NXjlbwlpg2p+g1Gnk+3cVK0=;
        fh=5naHwiE2iQXigxHgfqui4UWYvx94TDOhe5zlLBSYKKQ=;
        b=dcyfcAlThKasqh/KkJ7KFoxuWC0i1QR6fxBDrnVrm5bciMM0fGD8lishPkcU18fMWC
         09+leJbZ7lllXT2gvZ1entcBrvUDO0MyVy2X6OW7EahqIlfWHuAy2XYuxKf1arCuGrEk
         W8Eg9ZAZFM464R8HT5C/vZ3IePes5rq6Yx2beyaf91MhSQHcC4aVzl8+HSyIpyV40mrb
         FwVZFdlKVresaJZPjpiybhCBA3XsfgynneOEpvEWOs6fCAxQNKWNvqaOAA6Hb7J6z2K+
         L/T/5QoKf4sWP01WscUavHJe+P1QwgRV5FyDhn24ObhEQ7vwFe4ExDTW6tO4q7YaQApv
         s5Mg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793697652; x=1794302452; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KUBbiIfZu+24bweR1re7NXjlbwlpg2p+g1Gnk+3cVK0=;
        b=WNWl64WeDyWc36Z4C7ffvfSY9jydgrr9TqEWmKokkUZTF9N6lryKfocYx7XLltSW3s
         SNGzng8Pf08VOZhWg1QEraQp7faVx8/XY7xJG9fUJMpHAT6jtFekKYWjg8/FQvp/7x6H
         0RgGycBo9oNFAkd2NrZljPjNo5CaQwvmbpI1LtCbILOfwlbR5fgCxur/IcNeNhFThRRl
         g/L7KZgGxI4oZTYQg2SgXNZ+PeMU0hCS3wFG+v0ad95kWGT09xcS58PKW31HVbvY/Bdt
         jbZwCLuYdU48mbpGhXw1sHXMlUGzJgdBdjdgwwj8gXjDyTDW+GdtT4Ccy+wvc6H7sTxF
         5IcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793697652; x=1794302452;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KUBbiIfZu+24bweR1re7NXjlbwlpg2p+g1Gnk+3cVK0=;
        b=V3TZldBmDdKIAv31HhEJTmVJ5J2CzqKeTgJijQAmyH/NSsCdLkpCqiGclhgRiUp3ZV
         oEvMmSptNFjsX3+N46ZGcv0oYSAXDE7it/k6bycRy5CLqvMyBadiEQKWUkGYzhG2nDUt
         PINO3C4n4+z0/Zvfue1TrYvFyAv7nKXs/4vu9QJ9qc545Duj+POIhfwZHgY+yUhDaIfq
         a7cJdfO60IPnnzaR9w0zZ21HKj54qzkjcXPmwRYzIZYDe7QN+bHp16dT8OPg0WFjPb8f
         mbeHq76vjeLePKM6nxK24qfzEYKC8YiST0b8/bRXJ5IIKjZnEI2Zs2HkLRZlH79PLkfx
         hwyw==
X-Forwarded-Encrypted: i=1; AKwUvByGTkZSl6eB8A5MZ+77HaYPZRKTucnO20+14uEQKyo/BGaZw9qT5Qa/nufZRfJr8MzUdvkngKo=@lists.infradead.org
X-Gm-Message-State: APuU4Z9oZ/ovIu3TccIDxTjmruHK3tFF6WOf4lY2z7VXpDUHyG6phfi1
	ni/DqaHOV4yWetZfQ1JRv5h7VUuITnNdeicmPiMmH2eVOVvvZmt4yW0kba6yyxzxE2tZj4KFlHs
	lSVSPoNTgWi9yuw5A6K5baWH/23oqewahM4DbImgAhyIIskrGCl9XnFN2SpmNClBjjxvzf2MOb4
	gb74LAu11fAjncdvqSdOhjjte3b8guvPPkVdoykWI=
X-Gm-Gg: AYBFou1zuBMdylQkXyng5J8RoTSjCmA7DFKY9jfDhTHnN0uZFluWWiTJc51XnYMNfCF
	OHGtyG1vFBnlOCG6v0OakEHVIZGqxY5pmbS1jYAu3IG2CUpsVrlJ1O/c0JJrrtRmnBCAeiyCPHp
	DtOxdLV/RSfshGSzHFx/oPv2yUYQQIRNiYNJUlGPiUn4TG7e/N6HB0ETrHjJXkgi/h5/mxMdDJl
	eplpDgVNB1FZ6NG3hyPhUNVKnuq2lgo0w142v8R/Aatg6pRejeRKJ09Ub072imHy5aj4CFwFUA=
X-Received: by 2002:a05:620a:2b44:b0:93e:bcbf:4ad with SMTP id af79cd13be357-944216855c9mr2096033885a.33.1793697652129;
        Tue, 03 Nov 2026 01:20:52 -0800 (PST)
X-Received: by 2002:a05:620a:2b44:b0:93e:bcbf:4ad with SMTP id
 af79cd13be357-944216855c9mr2096030885a.33.1793697651561; Tue, 03 Nov 2026
 01:20:51 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
 <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma>
 <CAFEp6-2xY_gM=FRUp3R30TZ-NgT=-eYnyz_BPE0vxEenv+202w@mail.gmail.com>
 <CACB3TCKq--tdL6j+uGR_dxGdy-gHxQhY8p0h6xxqi_4Fd3VEOQ@mail.gmail.com> <c45bdcae-63da-4552-9e35-59ec6a71621a@gmail.com>
In-Reply-To: <c45bdcae-63da-4552-9e35-59ec6a71621a@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 10:20:40 +0100
X-Gm-Features: AclHuK9oFUU-GohF-bJ9l6vtg0lo68CrWTs2ZXBEs1Vyyp-LhH1J9qLG4HKSIt8
Message-ID: <CAFEp6-36Fc15uDWSR=v+xCMhERbkhggZOBoEFTF7pAcRLz_vFw@mail.gmail.com>
Subject: Re: [PATCH ath-next 1/3] wifi: ath10k: set the PMF peer flag on WCN3990
To: "Conn O'Griofa" <connogriofa@gmail.com>
Cc: "Nagashima, Shunsuke" <shunsuke@nagashi.ma>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>,
        Fabricio Akio <fabricioakio@gmail.com>,
        Aleksei Kharlamov <aleksei.kharlamov@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 43GVtth-sMdTUKbgxzpMGvV47bGAuomh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNyBTYWx0ZWRfX1yymUmf+u0wP
 Pkl/5peEniPf7H19PZfJsQbvvaois1xEFxr+5ZUFE/jPEEHArEAdoO/Rt2DH/JyjPnaCZnuy35A
 PHTRrCIn4YMis9vqCV1FOiscOITj+SKiOh9E+cTRn+rLxni4ena3j3bP3jK4+o6ZNMxuLBjIPR1
 HU8e+Q3ALQqrwjEvubcCy4yUUsTJnNiHxEHXzASfuG5sDdxKUjee6IXy0fCCB7HcBl0ZXZYN7Eb
 Qh8XTLfaAMLJrQFQC5lY5iiyY6aQEnXWR6P4uEJ1sWCJrblNq/LIlQ5z/tP78N3s+2X90uiDssX
 py2+0wARzTsS3j+M6mZWZ77tlj7EKxvC4u+nSoFoCa5rx8kN9uwia3tA88Dp6aAvOhrEhh3/8dA
 pwnwava7ixjqFxHy3KNRX2ajaNgrG4bgx/vgn0bxfKeupBZbl2lfRfeaqHzDUdfEouXBlQ1D3/n
 7JEit8C+ySFaFM2hrMA==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae9a775 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=3iNpH_K7wzUH7o6TWwkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 43GVtth-sMdTUKbgxzpMGvV47bGAuomh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNyBTYWx0ZWRfX9tjS+g2Mkprx
 S/3zbXl6db/hKp3KsKAmko//HHt4aBNxHq6l4+WpfM9knnfUXJXT1Fu5IRVSKBFGV3JCmh/HueU
 WQafz6pbsV0Rt6v8Q6OPpnTSUbtGqek=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_012053_930479_93FB181D 
X-CRM114-Status: GOOD (  23.65  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Conn, Shunsuke,

On Tue, Nov 3, 2026 at 12:57=E2=80=AFAM Conn O'Griofa <connogriofa@gmail.co=
m> wrote:
>
> On 02/11/2026 22:51, Nagashima, Shunsuke wrote:
>
> > Aleksei, Conn: a firmware file update only helps devices that load that
> > file. If you have time, could you make the same change to the
> > firmware-N.bin your device loads, test it, and send it to
> > linux-firmware?
>
>
> I can confirm that the unmodified driver with a patched firmware fixes
> the issue on QCA9377 as well. I appended the mfp-support flag to the
> existing flags for both firmware variants that are relevant to my device:
>
> ./ath10k-fwencoder --modify --features=3Dignore-otp-result,mfp-support
> firmware-5.bin
> ./ath10k-fwencoder --modify
> --features=3Dwowlan,ignore-otp-result,mfp-support firmware-6.bin
>
> Testing each firmware individually confirms the flag is now present, and
> both firmware versions can now reach 300Mbps.
>
> ath10k_pci 0000:02:00.0: firmware ver WLAN.TF.1.0-00002-QCATFSWPZ-5 api
> 5 features ignore-otp,mfpcrc32 18db2397
> ath10k_pci 0000:02:00.0: firmware ver WLAN.TF.2.1-00021-QCARMSWP-1 api 6
> features wowlan,ignore-otp,mfpcrc32 02bceae2
>
> I would be happy to submit the modified firmware, but I am skeptical
> that it would be accepted? I'm not sure if I've ever observed
> unofficial/modified wifi firmware to ever have been accepted into
> linux-firmware (which seems completely understandable, given the risks).

I think having this defined directly in firmware-5.bin makes more
sense, as the feature is primarily tied to a specific firmware
implementation rather than the driver itself. If PMF support was
introduced at some point in the WCN3990 firmware distributed through
linux-firmware, then advertising that capability through the
corresponding firmware-5.bin entry seems like the right place to do
it.

Compared to enabling it unconditionally in the driver, this also
prevents older firmware packages that may not implement the feature
from being incorrectly treated as PMF-capable. In other words, the PMF
capability should follow the firmware version, not the driver. As a
result, hardware using the same firmware image would naturally expose
the same PMF capability, while older firmware revisions would continue
to behave correctly without requiring any special handling in the
driver.

For change request I think the best for this is probably to follow
board like change:
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boardfil=
es.html

Please, keep me in CC.

Regards,
Loic

