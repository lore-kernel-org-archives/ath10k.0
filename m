Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1144606A324
	for <ath10k@archiver.kernel.org>; Mon,  2 Nov 2026 11:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oMz0OcMf;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X/Z3XcP+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aRvpSmu+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mmnkq7r8AkdD6QmqN02tP8SKsnUa5f5femOn5SNpdc0=; b=oMz0OcMfbhzyb0
	AW6B5tgnf1Q9SK3DKNMO5s0ilXai+n8BsnG7njx6axRsyB2GFajsYwZacKtD4NUgnnsZ2LaK79vnP
	P6CBUKIU+Evj2LVM+IVCh0e9i1H7jXGlItbocqwpnQVF9JTaKwcpeLjsDGz2r2xyf+/sAzi5wZF9+
	bxQv038xBoxaif+jGqj92tGtcpa8cPs+WSsxq/nQVc2hj1jgmGNXu8/q8fOKjKuLL3X3RBiVlEMZ2
	ZKKsl1licTXbHPi7h/AaWKZADWHeVpcf/NZxsNcP3R918UbhYi2VjdcO8rsJpIm3SyOQGEJrPO9hc
	VsP8gThXW8NRCA9hR6Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqf0-0000000GP3Y-0Fj2;
	Mon, 02 Nov 2026 11:57:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqew-0000000GP2Z-3t9V
	for ath10k@lists.infradead.org;
	Mon, 02 Nov 2026 11:57:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AS9N2880918
	for <ath10k@lists.infradead.org>; Mon, 2 Nov 2026 11:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mmnkq7r8AkdD6QmqN02tP8SKsnUa5f5femOn5SNpdc0=; b=X/Z3XcP+FasA2u62
	hBvPEOch8XR0fLIRDTeJplMth0A1Vs9d2y6vGzXiomLEN3RxdDoUPsIcdd15wBJE
	uiFJqYjqNMHkMdFCuarhLny9JH83i8LibaJDpKNNiLVuVUWlvcBGUC4NZGYGneZv
	DRfVyKUvFgTHcmGz/f6bgFyhW2QtmnYLEwPC25uFpEOk0dVV/MPL4OUjHRUzZMwp
	6W+ry/n7rXYwTZRLKj2eYEygt/14aI0B5BfPoIT7yW7WBysaBxaOVFKNjWbvIesP
	B/IS2ZmmQYcUe44EM/n3yWKDyhpL5kyCnVOMx6W89WqWBCkbCAlSp0W1AL3kYPPq
	Caq/Eg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgp4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 02 Nov 2026 11:57:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so276734885a.1
        for <ath10k@lists.infradead.org>; Mon, 02 Nov 2026 03:57:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793620622; cv=none;
        d=google.com; s=arc-20260327;
        b=nS+s2/+17t1ZT63gQ/ngbu2I1eX1upjd0W1CwpMF6d8PUAHJfSoGSECeO0fUiYsalY
         OSFPgWLCYEqSdQ+WuAHe6GkHMiMPUmiwuy7JTbEXOVu+puA4kD7MtiLd3GP6lktRXTEr
         z8v2WAc11ZMVr+EyiGp+1etkr/ldD+xcDRlp7OCHhJCtpPanthljXR0iHnMvTkpDcJOD
         Oyp2/WoIcyNrWKQisOkTQKO9fqP9AwNKOKmm6njwt8/jkEGoTPbv9/Z+VxvKWv7GD2fQ
         Nqi1ZOHV939Wv0iWg2Z6hE7udzEnJLq7gCjSDLtrsPaRrVYD0PaRaagKLH1IMYfteJXJ
         KXmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mmnkq7r8AkdD6QmqN02tP8SKsnUa5f5femOn5SNpdc0=;
        fh=ymoN24UB3GL1X4J0HSoqAliMyQv3eWy9ZzFm0ktUX6k=;
        b=YO6PWGelcYlRX0PYHYeA1e6+L62XAL2i5gfHm2lvi6C3Mn4jJQhSIbdagHkHHRqgCr
         OPM7V3aJHLKd817pHU2kxuj4NV6nE5nQaN7duoyCBxDreLcjCEthwm5DicvHwsrCMHOj
         GCSZQaWT1UpmaHb7fQ8nKSooT4lpAAaE94uF1yucu0MS9wk6DesLLby/jkE4sNt6HPdr
         mLtT0UYhu5lTLGozwFfhj4kwa/UhUNX2atTyWFRZrSHnKRCslUazYGsTI1V74xhov8rN
         lLHUgWdvg2x7pP6OXiJgfmVgrwoxynBmmu6IniaqoedLNbJComupXC2w3aP8DePTxXIt
         qwbw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620622; x=1794225422; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mmnkq7r8AkdD6QmqN02tP8SKsnUa5f5femOn5SNpdc0=;
        b=aRvpSmu+TJGOfx/z9JmCFuoUS0RYz2MlK67JdCJRwQC4lTDT2c4fr06XDy0EAN0qIx
         GOG3F57l8N9xYiyrrHXN7ohRdwLiU1EBU6fQajy9c6fCzNnpUnEIITb/AareC3/5JeXC
         Li3oavCoGENJDzVP6zeLRMDmXsISVx9MfiPxfLM0yJ2FH4H2NMnOSwW0S8X7qp8g/aTg
         5OUS/x/daVVw+PtGcpfnONnqM9bVTWpqMHHh9C/X2cYrSeH4kH2f+fPwAMult2635lZb
         SaeB13YhiOo6OCcboKm7WnLeGjbmBrfTm4gjwwgjy473FRQqKLTcxLoBbu0ohZ1GFqB3
         1DMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620622; x=1794225422;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmnkq7r8AkdD6QmqN02tP8SKsnUa5f5femOn5SNpdc0=;
        b=ej9bN5fDIwObZ5PmKJrIYm/6DcAeZNAGIMpwDYEkrICsmC0+aLknu654J7nuKI8bbn
         0OlQ7NoyvqW73RQ8JLk+hhS93Vhup1Fn3MpuS4Uz5RrFIilW1SukAiW2gwfCCyxvk3Up
         80mF254UIYzMtozlqV1C/Ren9iWaWgwDxFNEpy6dfcZpokVYwctTueyXhC/6KToJeCNy
         hNhsTnb537nsm5Xl2rLjd4RAONizdS9TG5zpIF/Z2Y4ZaOQqz9ciAtQjzKvaF5KAffmR
         gTjskKma0VHSasWALGmZxt6sXinmesUdY7IGcGrc3UKw8I4CQMLPj79W9TOeSF/Q9MDf
         kEtw==
X-Forwarded-Encrypted: i=1; AKwUvBwkTJHkv/Y6OZLM/3LF66YhuUteNNpH2cuyL981H3Q0kHA9sKuHpAjN0rnQLv/ZTd+pbUw2lJM=@lists.infradead.org
X-Gm-Message-State: AFq9FYLZ6QW30PcEtCWWfSZdP2mz8c7wKDoEWeIvXzS6GPFr79lbEDbp
	nOm6B6/64WcmQi7d63utbQvQeic7X3EMMolXmql0P+dlg6QtR1HfxVohoFyp5NU8bScNAsi5+GE
	7+FZ0yd4qzlJ930tvyyiiJGXGPw+1VMT7A0ivoXBDSjXMwSHTC7lwRh5qeooIfrLQx5DxoMEBO4
	EThUk0aPLRGIRKyzKMyOuV/noGtZdF8uPABwVyvi4=
X-Gm-Gg: AYBFou07poP/l+yTiUuPDC1FhwZl8HzsJIuH/AAhG/K0ukCkpih2pnTWXR56lCC6bDG
	XSAr266IxHn7LPepRGnEl47ZBAPWFaCKpxlpnt9KOa46gYxO5b8tewwA0muI4i22nidYTsjp9NT
	6bSW2LPMDjFDF2jf44f/+lHgpVRl0fbhLOEZ5AZlrOX/rsWmtXYW/PlYCpglLXKE3W6pimvsuwQ
	2JKNSi96M4OJb/1gqcyIcuolLRXnCdb0WcLg9mqSnQx+URD9V6L4vv0VGVAqAOXA40PuImiS/A=
X-Received: by 2002:a05:620a:46a3:b0:93e:5ef8:c794 with SMTP id af79cd13be357-94421696949mr1686125785a.38.1793620621499;
        Mon, 02 Nov 2026 03:57:01 -0800 (PST)
X-Received: by 2002:a05:620a:46a3:b0:93e:5ef8:c794 with SMTP id
 af79cd13be357-94421696949mr1686123685a.38.1793620621019; Mon, 02 Nov 2026
 03:57:01 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma> <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma>
In-Reply-To: <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:56:49 +0100
X-Gm-Features: AclHuK_UmYFEmXEjOcETGfLtpQP7k9aqsLUiYBNqC4WONvGRfPM1oQtAQ5xC4XU
Message-ID: <CAFEp6-2xY_gM=FRUp3R30TZ-NgT=-eYnyz_BPE0vxEenv+202w@mail.gmail.com>
Subject: Re: [PATCH ath-next 1/3] wifi: ath10k: set the PMF peer flag on WCN3990
To: shunsuke@nagashi.ma
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>,
        Fabricio Akio <fabricioakio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae87a8e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=nt0wqAW9UeTKEtDnEAwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: RlTvhdvflZc9IgdcyhwjNLYLn9ZMok9F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX/+Tks7sw+JPl
 11xPwxiYOTChOksf0c8WpIxOF6SwfPeoriWYI5u31B36QplSNVXCtDvgQ9mA0DHXxIO3QL0vILW
 BxzRUkd59dbdGfIuwX77ADEB3aHrLaI=
X-Proofpoint-ORIG-GUID: RlTvhdvflZc9IgdcyhwjNLYLn9ZMok9F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX3A6d46Xg6rGw
 b80n8X8IUyHJrJeth2dIFP92NcYxj6TN59dDYzgtiElyB2G7LYCKnzmRKkgBchED0TGTgPtywU0
 VrlV52OE1wXaKOEhhIETL0CePLNxiJGYTDvZ5lQX+Rp0hKutBRs/LP+EeaXkeocJe99PidVkFDW
 2mlkIcRSvUOQ2BMEV71EJaH3ut5iZQ4bkcm3vbiJXv26tt25+L6o/OOUT0Y507VXzlMBfqHw22c
 lziSw5uTU0MR4rLMzHrLoTXrHATXFl1R+ARAYu+6CGtOIxsmbnqKDurv5FGdAk1JNkXNrEJtHhv
 QuUqCUTdlpahhvC6mUw4ll1eAuVL7HKtKpUiBnhL37lx78DalSF8VeGvhXdxiTO3qGfj0H2XZ4x
 TyLZf8YZt8d2FdL0EnJjsy4W5WtPJ9rZZs6Yqf8GgwN9RFd0Q6lIvWusgvo/jajsVkP+xvYhuEp
 bMpgXV7n3N+04LJOJXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_035707_547831_8038F9E6 
X-CRM114-Status: GOOD (  26.66  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi folks,

On Fri, Oct 16, 2026 at 2:18=E2=80=AFAM Shunsuke Nagashima via B4 Relay
<devnull+shunsuke.nagashi.ma@kernel.org> wrote:
>
> From: Shunsuke Nagashima <shunsuke@nagashi.ma>
>
> ath10k sets the PMF flag in the peer assoc command only when the
> firmware file advertises ATH10K_FW_FEATURE_MFP_SUPPORT. That check came
> with commit 90eceb3b5fb0 ("ath10k: set peer MFP flag in peer assoc
> command"), because at that time "only firmwares 10.1.561 and above have
> support for MFP". The WCN3990 firmware-5.bin files in linux-firmware do
> not set that feature bit, so the flag is never sent on WCN3990, although
> mac80211 negotiates PMF with the AP. ath11k and ath12k set the flag for
> every MFP station.

So why not updating firmware-5.bin file instead?

There is a tool available here:
https://github.com/qca/qca-swiss-army-knife.git

And you can retrieve info with:
./ath10k-fwencoder --info firmware-5.bin

And add the missing mfp-support flag:
./ath10k-fwencoder --modify --features=3D[BASE_FLAGS],mfp-support
~/Workspace/linux-firmware/ath10k/WCN3990/hw1.0/firmware-5.bin

Then you can submit a firmware update.

Regards,
Loic

>
> On WCN3990 (firmware WLAN.HL.2.0.c10-00459) in station mode with PMF,
> without the flag:
>
>  - The firmware sends its ADDBA Request frames unprotected. The AP does
>    not answer them, and no Block Ack agreement is set up, in both the
>    2.4 GHz and the 5 GHz band. On a 5 GHz WPA3 AP, iperf3 to a wired
>    host gave 22.6-31.6 Mbit/s up and 21.6-21.7 Mbit/s down, against
>    280.2-283.0 / 264.5-272.3 Mbit/s with WPA2 on the same AP. A
>    WPA2/WPA3 transition network gave the same low rate (23.4/22.7
>    Mbit/s), because wpa_supplicant chose SAE with PMF there.
>
>  - On 5 GHz, the protected Deauth sent at disconnect carried CCMP PN 0
>    (56 of 56 in one capture). One AP dropped it, kept the old
>    association and answered the next association with status 30, so a
>    reconnect took 24.3-24.4 s instead of about 5 s. Another AP accepted
>    the PN 0 Deauth. On 2.4 GHz the Deauth carried a live PN even
>    without the flag. I could not tell whether the band or the AP's
>    HT/VHT capability makes the difference.
>
> With the flag set (this series, in a build without ath10k debug):
>
>  - ADDBA Request frames were protected and Block Ack was used: on
>    5 GHz with this series, and on 2.4 GHz with an earlier revision of
>    it.
>  - WPA3 on the same 5 GHz AP gave 264.2-279.0 Mbit/s up and
>    236.8-246.2 Mbit/s down, and WPA2 283.4/261.7 Mbit/s. A 60-minute
>    upload with 4 TCP streams averaged 277 Mbit/s, and a 30-minute
>    download with 4 streams 230 Mbit/s.
>  - Deauth frames carried a live PN, except when the Deauth was the first
>    protected frame of the connection. With one MAC address, 100 of 100
>    connect/disconnect cycles to the same AP connected, with no
>    association rejection.
>  - With an earlier revision of this series (the same code at run
>    time): the transition network gave 276.9/249.6 Mbit/s, and in about
>    8 hours of cycles, every association that followed an acknowledged
>    Deauth with a current PN (not 0, and not older than a PN already
>    used; about 1,300) got status 0.
>
> The vendor driver for this firmware also sets the PMF peer flag for
> every PMF connection. On the same device and firmware it reached
> 259.0-269.7 Mbit/s up with WPA3.
>
> Add a hw_params flag and set it for WCN3990, so that the PMF peer flag
> is set for MFP stations there as well. This also applies to MFP clients
> when WCN3990 runs as an AP.
>
> Tested-on: WCN3

