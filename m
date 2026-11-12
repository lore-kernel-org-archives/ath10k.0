Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9C3606A321
	for <ath10k@archiver.kernel.org>; Thu, 12 Nov 2026 16:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sub5KI3/;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bcz5TGQT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WzBmtKmf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fRjlbPU5AVtf9EK1IKurnyPbNjAMOrscQEXjpMumO9U=; b=Sub5KI3/aMuiCM
	XLWp4aOsdIDl1+pREww5AInwRWr1JRU7LbKF1pIXhwqaSNsvoDweBn4bRY7NrxiYu+auFlfJ9TK7a
	faFfSMpq06pfVKWRsmRsNTEW7ADE8p/5VS3ccYo/MpWJFUQcePqkwPMS3bFE/k+Cfl9e00PRG+RmK
	L3FHirEvfQ3JstoLZLgYDF7RFz1c/z7tXaOximKwejcGutIOLx/g9gfZAnasoqo77qb4QagGyfbLc
	h50yaOSWHgpadW8fh8787lDxW4r9qr5qkzck0e1W0IqJOfirsefCjafuBQdWJvlStWFVyH/yPBesa
	5UM3mg7A4b9xxkd3jEQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRY6n-0000000Ah1R-1Zov;
	Thu, 12 Nov 2026 16:57:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRY6f-0000000Ah0k-10Gm
	for ath10k@lists.infradead.org;
	Thu, 12 Nov 2026 16:57:05 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZVOE1159594
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 16:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fRjlbPU5AVtf9EK1IKurnyPbNjAMOrscQEXjpMumO9U=; b=Bcz5TGQTsdCyop/x
	qrQtakQQtXkszBZNjJEiuRvmzikCasRJw9HDDpNbnP3jeByhcINBV1J7leVHBMXB
	itzOhHA8A/xz3nCrwx0u6+lmKqSqq6qV15O9o9thuOStEVeqxO4whP49PY5m3EXd
	X+u0AsWStBIKJNZtyh8eOzzgmlc7owxGGJNj+CqoStj6+i/xuRqQ9WdU8+HCvR23
	MR/tMX2cpV/5G0U09NO/lNmd+LvO+Oxyvnl+Ytrv8/HY5xmrBkIiMaj6eGJ9F+65
	IzdrkaDlLoQ8Y5p5qSlCLGeDAYwk+P8fWP123UO2s4y9dcci426+dCW26hYtARJR
	Rg/dgg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a0a19h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 16:56:59 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4fb73e868aaso6215101b6e.0
        for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 08:56:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794502618; cv=none;
        d=google.com; s=arc-20260327;
        b=MwUt/rSos+l79MhTP5UC4kBuA0poD8MqEXM8cjLOg/TD6Ig1q+wPdVwUvtukrWRc7y
         lTyFfUCvAD2GeQXRvJY6rG7hva/9xjLrlXQRoQ7M0nukfpofuO3kcU9ZCFM7mXIY+z8s
         IK/FouBHGltVuSM6jey1E8WW7c6alA9n3DtVtvPUyjZwUXGjUurE2zQvLEjOQXM0aabn
         7CBcWTaFBz3XhCPZ23tim9EkV1zQpz9ETmEYoqOC6Z43THlHwmb27hy0TegvZd+qqL9C
         vf5l50gmcDD9JLmbXzA6FdHlRHyFSYmqN4ZlOyFdGVVDuaVEUpj+q3CAJoq6E0MNJSBx
         EhrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fRjlbPU5AVtf9EK1IKurnyPbNjAMOrscQEXjpMumO9U=;
        fh=CDt3FqZ0SOLOC/jvrkAeMWpfLi0vEby7j6ejsmCYr/E=;
        b=YMaMjJbHI1jFKWginJ0dfhagIpTQfvWtOlQmFc7rqicrzvMcfKUJvoffuu0bZ/0cOf
         u/HeE38jrp0vcFS/BemaJT0fDsKmHu9Oyz8fYvUWhHvVsQpmRG4MLa/DOGSyvZ3gzFmX
         c4P8pVS9IdvcvynTvAOVm9VfV/do+abXRWl53npDtzCVl1/y13QSNWQClZpH0OnUrdmW
         YHiE9J1W6AsOYigDwiaSpJffty2iI7gljt85qal4OwBXFXNfrH48fWuiG9WpoeEYKgA4
         8UmH1y97thahiyB3xx3XVDVVYidrd/UysqdBfoGqLD3bwtMLe91yuNparhxuYzQiyErD
         ++/g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794502618; x=1795107418; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fRjlbPU5AVtf9EK1IKurnyPbNjAMOrscQEXjpMumO9U=;
        b=WzBmtKmfsVid9PRYxEXEOT6IPPCCwgNxDKE67idBdd38SfhVOZqLhDiwMe6/h3SXQM
         udL/sNgjGimOiFVr2bgTRDvtWHth9w8TOJomd7BKI6YxwFSMnb1AY7dpAg5UqYkqXIyk
         0twW3xAGy9pJFPQbv0FgGr4tLFWVbTuDiSxPZxLl9Wzk8SDyjalZ6B9vCbNGRZF6J82G
         EzVWdLiwcky+BbKrqh/oO0vQSBVCM1tu28dh9BUukIEotJaDtHtxe/OEjkrEwC5knD2W
         //5BYgD3tL4Oh6eW4/DbR9faCr4htHlCMPKLSzNvF4AMjIexcZ2aFHT4v/AzWuUn/47s
         bUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502618; x=1795107418;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fRjlbPU5AVtf9EK1IKurnyPbNjAMOrscQEXjpMumO9U=;
        b=HRN0Bx2H7N7e4nyDoV9lNm3XtF9HtVtYGd1ewPTEfAmfzhfdbKhGNNZCeCpaIzfFRD
         BDBfl3UWi9SmsBLE8l8AUUR5wOV5d0Akhb+hoEWKLuot2+2X7ejPZEuIsX8yArw7795f
         3XP7vFhjXtiiIIdrnnaY6zKmNCkNk97myBeTsnkt8QYH7i8tiK86A7pYnbz8/y1wtUKj
         UsAZUabqc3Hl6rEMk7E507rWM94hilYjV/GU4gvTLILgDwhM6IqykdT36Qrdgmaen/s+
         FEyGcJIcl8bSHWQ5T/bcDhiDFWCrlfTWGkuLc62Suh4kNujUDRrxSYJCb1zFbZg/CmYZ
         CG8Q==
X-Forwarded-Encrypted: i=1; AL+hErHBbGqBKKSpN37+cug/jt6r1xsniNd87cooWTObXsDa01Mkgt6AQZPavD2oY1fdwnATTKlYZa0=@lists.infradead.org
X-Gm-Message-State: APuU4Z8BrqjC/B0qvIb2Sh86IL2XwHxO1bW4cu1Bj7Ag2HBdcef1XFrw
	mgL4v+993qsElgBPgz5LNxHR1s/hm4lzi1rDForj3/ZqUlBECAMp0LvU4JBdiBbFdKM/RMgrVew
	gmqLcyS3R2hEKd5iSTCUmVJ+pHkeDU4/+1q4O4pI/TS5GKuJWpZNmHfRpxkCoUYSy3sRPuljHZn
	LQ3viI4mBKymmCarGIpb/Oo1awdNEooHp2ahfqKkc=
X-Gm-Gg: AYBFou2fjN3J+T+cHXBEPplmy419/5si8bSlGnlHAe8GiUm4cfi/z1D61/EJkHmmWMp
	V2yQisB4CXwdxPi9ESyP2ybKzIvq9lytedOBmztBkXP6ZlcClbx5mokKhWQX9LuuJCnSmPFUm4I
	+sjmPh4Z8ETXQ0avnuQMinIfhx3XkvmOopTJkgTV8uQ+C5oVoNARmTXImyfaQQXl2Wtr75RLfAr
	KDTLOUbX08uPkhzffSAsMFFtIsZY+seNM6ZYpHlbXEdVV1ef3RFRdDkoo1QJbsuLNepSCbmAQc=
X-Received: by 2002:a05:6808:1793:b0:55b:f88d:6eb2 with SMTP id 5614622812f47-56b9344bd80mr6050534b6e.6.1794502618092;
        Thu, 12 Nov 2026 08:56:58 -0800 (PST)
X-Received: by 2002:a05:6808:1793:b0:55b:f88d:6eb2 with SMTP id
 5614622812f47-56b9344bd80mr6050504b6e.6.1794502617512; Thu, 12 Nov 2026
 08:56:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
 <DMRPC2GCD51O.S4DMHZFDKRFG@gmail.com> <CAFEp6-3PWumihQLg0CPR+U40sEUkEwU1EL7mgq8rnnmA4veSeg@mail.gmail.com>
 <DMTDV3EMV9WV.TFY5VECJNNR4@gmail.com>
In-Reply-To: <DMTDV3EMV9WV.TFY5VECJNNR4@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 17:56:44 +0100
X-Gm-Features: AclHuK8kw6CKHb_cdjRA4WaRGGYqyVwyIm_3dyHy1Bz1q5JMBMCptBcM71ms0EM
Message-ID: <CAFEp6-2a-0NSmSZXOdKNfB+C+2T6=hmaBC2zV-sfkCrDwZu0GA@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
To: Nicolas Escande <nico.escande@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Filippo Falezza <effeffe99@gmail.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: -uF8TcD8_gnLa2URbjQniczMAs8ySGsq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NyBTYWx0ZWRfX044AbAqfstnS
 eHSlCRcF5DvH0KfcJa1rFJorXMLepI11WYvGtRlo7VlCkq7Z//cREQ1n8uF7jtyEbQZrIfUvyMR
 44/gXAFoTY/Y0k9HEeX8hL+syL/H2omjfShpTZUSGZrfd6f1Xafxzf7tMbXDpQIe6u++0wGZ8p6
 FV8OeuCeGpheiO3EZkvzrS1GYUyuwETlhB/pRZ7Z/SoMjl8+im2RHLKpipvv7mz27r+XDIbG5U/
 eFml4VqxpK4b20Gc+M1Si814jVgcHS3ST4J/8F4e/UaoqNbOLfLwh4lEVnmAArlILo4GV62Bgfd
 83TCCHzWY5/zeTqPYoef6Y+RFIEytodWndafX3XgbEzEfRRvIHffLlZ55UNaQA4jSZ+IMfp1KVD
 uC1xjtZQZXlKnAWPWoFbYo2R2kD/RXaqXfg8vvsli+DJoi292CAggBUpcztkyIG9Iqi4F6Re3K/
 X75+WmZ47MZDYcTkWIQ==
X-Proofpoint-ORIG-GUID: -uF8TcD8_gnLa2URbjQniczMAs8ySGsq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NyBTYWx0ZWRfXy9RsuoLTKnqh
 w388LpwOG2YnpmW13cfpa+PzZnKv5hF2he7JoXUi32e9okxuzS5BZPsuhksCbljz+wkE72eIY1N
 yMvI5nKUUmTSF0eRs/SrsrlNK3wQoPs=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af5efdb cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8 a=OQFpW5qx3RqhGcwZRAEA:9
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_085701_401621_6215F979 
X-CRM114-Status: GOOD (  45.46  )
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

On Thu, Nov 12, 2026 at 5:46=E2=80=AFPM Nicolas Escande <nico.escande@gmail=
.com> wrote:
>
> On Wed Nov 11, 2026 at 5:30 PM CET, Loic Poulain wrote:
> > Hi Nicolas,
> >
> > On Tue, Nov 10, 2026 at 6:20=E2=80=AFPM Nicolas Escande <nico.escande@g=
mail.com> wrote:
> >>
> >> On Tue Oct 27, 2026 at 2:56 AM CET, Filippo Falezza wrote:
> >> > Reading the ath10k hwmon temperature sends WMI_PDEV_GET_TEMPERATURE =
and
> >> > waits up to 5 s (ATH10K_THERMAL_SYNC_TIMEOUT_HZ) for the reply event=
,
> >> > holding conf_mutex. Not all firmware answers: the WCN3990 firmware
> >> > WLAN.HL.3.3.1-00694-QCAHLSWMTPLZ-1 on a Motorola Moto G 5G Plus
> >> > codename nairo (SM7250) never sends the event, so every read of
> >> > temp1_input stalls for 5 s, logs
> >> >
> >> >   ath10k_snoc 18800000.wifi: failed to synchronize thermal read
> >> >
> >> > and returns -ETIMEDOUT. Tools that read all hwmon sensors, such as
> >> > lm-sensors, hang for 5 s on every run, and configuration changes of =
the
> >> > interface wait for conf_mutex in the meantime.
> >> >
> >> > Whether the firmware answers cannot be told from the chip: firmware =
that
> >> > answers and firmware that does not both advertise
> >> > WMI_SERVICE_THERM_THROT, and WCN3990 firmware differs between device=
s.
> >> > Instead, remember that the running firmware did not answer, and retu=
rn
> >> > -EOPNOTSUPP right away on later reads. Forget it when the firmware
> >> > starts, so that a restarted or updated firmware is asked again.
> >> >
> >> > The first read after each firmware start still takes 5 s when the
> >> > firmware does not answer. Reads on firmware that answers are unchang=
ed.
> >> >
> >> [...]
> >>
> >> Hello,
> >>
> >> I've just now seen this and it will break some setups. It seems that s=
ome ath10k
> >> devices that usually respond to the thermal WMI messages sometimes do =
not.
> >> This is from a QCA9888 that does not have your patch yet:
> >>
> >> [431710.509443] ath10k_pci 0000:01:00.0: failed to synchronize thermal=
 read
> >> [433385.529449] ath10k_pci 0000:01:00.0: failed to synchronize thermal=
 read
> >> [434755.541438] ath10k_pci 0000:01:00.0: failed to synchronize thermal=
 read
> >> [435385.549438] ath10k_pci 0000:01:00.0: failed to synchronize thermal=
 read
> >>
> >> Like you I have a daemon that reads the sensor periodically and it sel=
dom
> >> fails to read the sensor value for whatever reason. Most of the time i=
t works.
> >> With your patch once I've hit this, I will never have a valid reading =
anymore.
> >>
> >> So how about I post a new patch that only fully disable sending when w=
e have
> >> like 3 consecutive read fails, and in the mean time I can also lower
> >> ATH10K_THERMAL_SYNC_TIMEOUT_HZ to 1s or so so it doesn't lock up for t=
oo long ?
> >>
> >> Jeff / Loic is that ok or do you have any other suggestion ?
> >
> > I'm not particularly comfortable with such a solution but since we're
> > already introduced a workaround, I think this is an acceptable
> > approach.
> >
> > Would it be possible to implement the retry loop directly inside
> > thermal_show_temp()? A one-second timeout seems more than sufficient
> > to read a thermistor but it would also be useful to include some
> > information about the typical read time for this kind of request,
> > along with the timeout change. I assume the actual read time is well
> > below one second.
> >
> > On the other side, since you've been experiencing sporadic thermal
> > reading issues, have you also tried increasing the timeout to see
> > whether that helps?
> >
> > I think including these details and any relevant measurements in the
> > patch description would be valuable.
> >
> > Regards,
> > Loic
>
> I think that what Jeff suggested makes the most sense. If we ever had a v=
alid
> response, never disable it.

Yes, that's a good suggestion. However, we still need to define when
to fail. If the first read attempt fails, how many retries should be
required before concluding that further polling is unlikely to
succeed?

In this case, the in-function retry mechanism could indeed be useful,
provided you can validate the behavior on your platform.

>
> I've tried in the past to increase it. But that leads nowhere, its not th=
at we
> dont wait enough it's that it never comes. Or we missed it, I have no clu=
e.
>
> Regarding the behavior of current chipsets. Ive added code to time how lo=
ng it
> takes. From before the ath10k_wmi_pdev_get_temperature() to after the
> wait_for_completion_timeout() so my numbers are affected by the platform =
it runs
> on (cpu ranging from armv5 to A53 & A72). Here the numbers from multiple
> devices each running one of peregrine/besra/cascade
>
> =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=90
> =E2=94=82  Chip   =E2=94=82   Mean   =E2=94=82 Median =E2=94=82  Min   =
=E2=94=82   Max   =E2=94=82
> =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=A4
> =E2=94=82 QCA9984 =E2=94=82 88.9 =C2=B5s  =E2=94=82 85 =C2=B5s  =E2=94=82=
 75 =C2=B5s  =E2=94=82 348 =C2=B5s  =E2=94=82
> =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=A4
> =E2=94=82 QCA9888 =E2=94=82 148.5 =C2=B5s =E2=94=82 142 =C2=B5s =E2=94=82=
 99 =C2=B5s  =E2=94=82 418 =C2=B5s  =E2=94=82
> =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=A4
> =E2=94=82 QCA988x =E2=94=82 205.7 =C2=B5s =E2=94=82 187 =C2=B5s =E2=94=82=
 108 =C2=B5s =E2=94=82 1193 =C2=B5s =E2=94=82
> =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=98
>
> So for a sensible timeout value, I suggest a few ms, even 25ms or 100ms t=
o have
> some margin. But maybe you guys have internal knowledge of the expected
> response time ?

The 100 ms timeout seems reasonable. However, will it actually help in
your case? You mentioned that the failures are sporadic. If we happen
to read the temperature at the "wrong" moment, is it likely that all
three retry attempts will fail as well, or would it be better to wait
a little longer before retrying the read?

In other words, do we expect a short retry loop to be sufficient, or
is the failure window long enough that spacing out the retries would
improve the chances of success?

Regards,
Loic

