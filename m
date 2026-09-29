Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3472FCA5FA5
	for <ath10k@archiver.kernel.org>; Tue, 29 Sep 2026 14:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SRKnDrY0wdCPcMZOZoHpHCB3ChD9aweWoj0J1WVM3Ho=; b=laozaGA6kpVnoKKoKynQT6dQKK
	cIrbiJNGS3osRe+QX38Li+07cjezmMrOoDPz0EBq6iQZs1rMxKbgcZE2IeUSD7YNY5R1OauMFD1II
	f0kfSJRhabGaZY/vPuB3ioXOVuMY2XVmdcNmc90cgnTh/OjmhJzKWtTM3ZEpSihIIq5c7jovu5ZZJ
	qMsO+jO+Ti2SjCEKrrJXkDmi3oPfgzzMxSRPsbvi/osFn2xJptlXxa36DwqfFdnYeqSirlPeUCuPQ
	omTVeyqCfmqi++KH8B+YQEzdK3S5E+k91/PpoSGCwLg2Me8WqzFr78uh4LtCpJWgFSfceOuqz9AD6
	9XMRU81w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYP7-00000003jpv-48OS;
	Tue, 29 Sep 2026 14:01:57 +0000
Received: from mail-ed2-x0d.google.com ([2a00:1450:4864:33::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYP4-00000003jp8-2unE
	for ath10k@lists.infradead.org;
	Tue, 29 Sep 2026 14:01:55 +0000
Received: by mail-ed2-x0d.google.com with SMTP id 4fb4d7f45d1cf-6ac768bda6aso3590463a12.0
        for <ath10k@lists.infradead.org>; Tue, 29 Sep 2026 07:01:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790690513; cv=none;
        d=google.com; s=arc-20260327;
        b=PXw0j+QwMqffywDhRNyOtmuypxcYLNtHrXwniivJ5zDLsgK+WgXpB1CH6qz4GTkOf0
         oEIhgOuGXTub+wxurKx38hzOnlPagx+KzJmaW2Xirn/8rH3uDPaqonbkfYAvMn4WkEVD
         ZWMMSd2UOcaRYPDSwqFWVU9uHB9D2TanKHGsGCMYk5DvYv5JgrbSfGAky5ixNu20L97j
         1jyOL4CybmzDxm4HXGHTw96+/Uq5qjp/NjY4fpbvp5bUDS0a59RORZ7YcfXeM0Q2xiZk
         GBGqdIsx8KWYgTzE0TFEqs0E5SD4KT6E+S0fNkDEbHKW51dbCFETyGb/UZ6s9eIeX00u
         aifw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=SRKnDrY0wdCPcMZOZoHpHCB3ChD9aweWoj0J1WVM3Ho=;
        fh=1VIYtGFf30dJYJLkM6/GimrrcyPdEjtwrXjb0BDfp48=;
        b=MPqpZrs5wZ0LucR9klGtdkgvluV8RsQQZr+7BvHbd64wggp8bvzHusc1YVNTYIdIcY
         hv4L1hRWM8Q8mIcdf+XMZ1jJk8VKcejWFmdqMEHgSRpB156Mdvf4Tl5rtMrJdLVHkWvD
         GBIeoxjkEUkrF33zotyCfTVAsvGiK9dXr93jVVlWJqyfiYa849W8CQmd0mkykDUYFo8N
         88taA7amL4ecNO7McyTBYbAqhNLjkOkhfOEpy9PzivcMmI7X5sJDVxELtu9R1sYs118+
         p/DjtOohxeMy9g6Z+3b/0tc99/xlEZ4lkvwGemkzy8aJBh4LO3r4lWPzN2VHef8E575w
         d+DQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790690513; x=1791295313; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRKnDrY0wdCPcMZOZoHpHCB3ChD9aweWoj0J1WVM3Ho=;
        b=BBa06hZpnA4yoU8/ZYmV08lpXjZih9IgXBcYzNiW6G+L9WpL+LKTcrjlGNOfdN2Ztr
         CIR9yAG0WtpaqsMHm9qAp77gNGRMduA9hVBEamLxV3IjPtEIsZ6aEqT/pAfM71cgueA6
         uxmgKAiyTVAijANLJrIkaeqgOZ0WCa90ahzdRnP/gX76JyiJ3+kWSwsv8hv6j34i+yiP
         EqbVsphiGVOItLFEQmZnOom5edupN1zNbjc6ljklEoqBHzXFdPcorKTHWDazlrc+GrzM
         9wEpKgh6Rf5aLe2Jwq20S/paWX2QBc9VXW6Jil6LQ4mOhwF/fz08uxvMGsWaraY+0vL+
         jv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690513; x=1791295313;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SRKnDrY0wdCPcMZOZoHpHCB3ChD9aweWoj0J1WVM3Ho=;
        b=QJjaxyTm09l/yccOasJHCo8wFhVFMITLIzXydpDfrldA8P9gUWXbKlC0oqQFg7Sg+S
         sX8RFB+llBy0yAl+GrzVBr4oTQLQZAj8hw6xUw7mJjdWhZH7X4HrbQd72rBAZo/kgibv
         D8Xc7bzOuoD9ywIfbRxnWbJOsLiGBxma7hwnxxMN5BOR5pz8bZ3+Yxe7zJh5M+Xc+Hnz
         TO17I1FlLc/mxprFLkk47S1AoESZAwkSgw1sO9ljlacH9nGWr2NNHfh46KE/Bq0aEfkX
         Dl/1TQHIbIfEytVlbOYjBoWvYxh4UogmEry0SRumk4ZUrG2XIBExGnGp4mU1IDTpviAC
         PgZw==
X-Gm-Message-State: AFq9FYJW2Tm5Oist4YY9eHDEK4Vcy9y5XaKgY4CBISnWO56pV/yoMzKP
	pHOWNGgXns5+UKe75mBk/QmtbxpO+xSTVzEQCfTNL3g9n34dvTmkkibWmsIE6fYJcpdTuiDF9/s
	+5uRsDx2wbVSISJYsFwb1UpzlZfvSEdrXZc22gEQ=
X-Gm-Gg: AYBFou0+fAZIigBZluNa2CFdy0GNouEAmJ89kmr/cyWZYlT+5Ylb4Fyk6/9HAy1zjYn
	4uKB79jJqoJ6UkRE2V8ildLH/jmF2AR+ZeupcYrA5E+wXsNl/shRwla4tYKgJvZO6FC7Fb6w+cv
	vkTFD9U1N+PsaDi4Atno8kexsaqmElHcMIIXTjpcz23V0kLWRewesdDNFf2ISB/Hu7nxkQ1s+EY
	cDZA8GQgELRLZJFs3fkZ1bBBoVviTsqxzwnHHtot000hOAUK1QpmxBqnzzRRTvQCM2bk5fBQYDa
	zkAkmqkHpYhwAcJ4eKdBCT2jK2BzAjNfDhRfCFuvU162jaxlOxPcxDSYpCPNW6zENqVNTVjdPYG
	LEpveYuqHozurzL4OT/AvJwqyzYQYz3E6a+ej7HmDJCKmpKqIdQc5mcTtkX21hUoKXBe5T1Dsq9
	zziKsaB3TH4GPuV1Rz6K8D9h5gI8kvbtivm3A6pgbuOu6MoSbtzCDXPww=
X-Received: by 2002:a05:6402:438e:b0:6a9:a2b9:5907 with SMTP id
 4fb4d7f45d1cf-6aac8f40c5cmr12012009a12.4.1790690512605; Tue, 29 Sep 2026
 07:01:52 -0700 (PDT)
MIME-Version: 1.0
From: Ashley Robjohns <ashley.robjohns@gmail.com>
Date: Tue, 29 Sep 2026 23:31:24 +0930
X-Gm-Features: AclHuK8KB_T7cdZq3513KMT30pm3TpVUiysQ6uYJ0nBBWncHc-tbO1gFu6o9l64
Message-ID: <CABvXTrA8g64u7_vb_ux+ysefhg=4ppnmLrk=xdVNHcDd3dAz9g@mail.gmail.com>
Subject: QCA6174/Killer 1435 - wifi receive speed halves after several minutes
To: ath10k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_070154_747341_A678504D 
X-CRM114-Status: UNSURE (   4.64  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

After normal non-demanding use the receive bitrate drops from approx
550-640 Mbps TCP to 175-250 Mbps TCP after several minutes.  Tested
with iperf3 -c 192.168.0.200 -u -b 300M -t 15  on the local LAN
against another machine connected via ethernet the tests consistently
show degradation of bitrate at around 4-5 minutes.

Link statistics remain stable throughout the connection
signal       -45 to -49 dBm
frequency    5320 MHz
width        80 MHz
RX rate      702=E2=80=93866.7 Mbit/s
TX rate      780=E2=80=93866.7 Mbit/s
VHT NSS      2

Issuing `nmcli connection up "Kite_Net_T"` cycles the wifi and results
in the higher bitrate again for several minutes, with it then dropping
off once more.

This results in d_pdev_resets: +2, but no firmware crash throughout testing

Testing over on LAN with iperf3 -c 192.168.0.200 -u -b 1M -t 300 -R

The first 4m53s were stable, then jitter suddenly increased and still
0% packet loss

...
292=E2=80=93293   996 Kbit/s    0.558 ms
293=E2=80=93294   950 Kbit/s   13.194 ms
294=E2=80=93295   1.03 Mbit/s  14.351 ms
295=E2=80=93296   881 Kbit/s   13.513 ms
296=E2=80=93297   1.05 Mbit/s  13.042 ms
297=E2=80=93298   1.04 Mbit/s  15.800 ms
298=E2=80=93299   1.04 Mbit/s  15.492 ms
299=E2=80=93300   1.01 Mbit/s  13.171 ms

Bitrates will remain like this until the wifi is reset with `nmcli
connection up "Kite_Net_T"` or higher (ie. hardware reset, etc), and
will then again achieve the full 550-640 Mbps before dropping off
again some minutes later.

Dell XPS 9575 2-in-1
Qualcomm Atheros QCA6174, hardware rev 3.2
Rivet/Killer 1435
ath10k_pci
WLAN.RM.4.4.1-00309
Manjaro Testing branch
Kernel 7.2.4-1-Manjaro
AP: Telstra Smart Modem 3
Channel 5320 MHz / 5 GHz
Width: 80 MHz

Any help would be greatly appreciated.


--=20
Ash Robjohns

