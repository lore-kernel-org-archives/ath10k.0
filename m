Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB274C3271E
	for <ath10k@archiver.kernel.org>; Mon,  8 Jul 2024 10:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHPq6XGox2t5QBzjMLQf3aMokr2bbVCFuM47TTyBV48=; b=T7VucEMxmcvJdpOoTObRNlPNj4
	6GQti8ncCipKNoWVPDbzkV37kFopRzpen0wnZ2fqF3IrgTGj8+tPf0XdynXtGBz2DCGCQQNs03ZPD
	beXL6FC+/OHlh6h4Vp93QtVDZiOIEU/RE9uqHp/uShw+S8U9rNXybSDbeH2il8O12FYdFmt6002J3
	s4jm71aG6jHxe6p5gxsH/eU036YAAZlm9K8BG/1q88sqwj+Qq+cminwMUnO6GyZXGDq2xefSb7XBK
	2YQ4YNX2JgPz5/Afj+zR76dj+1MKa6gXsky6+NKttGNsjgza2bve0GCHBpaCj+h7ITvlK7tiYLOwI
	kgGtvKYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQlgM-00000003Sjw-0E4k;
	Mon, 08 Jul 2024 10:33:18 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQlgI-00000003SjT-44mZ
	for ath10k@lists.infradead.org;
	Mon, 08 Jul 2024 10:33:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D838CCE0950;
	Mon,  8 Jul 2024 10:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 950FFC116B1;
	Mon,  8 Jul 2024 10:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720434792;
	bh=WHPq6XGox2t5QBzjMLQf3aMokr2bbVCFuM47TTyBV48=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=W3Cyg1Vwy3FFg1cZWs9jmLvodhj8id0aPGwX7oukQDFr3XEq38uxdHJRhNIjC0mG6
	 By/8xO5k3w/jrBJ+VQzQYPowUal2cDIK4ICRae+VeYvOwJhcUkDXgF2IchS61TxSXa
	 N+ujTz23HaMpfEHWI5X9HY9IIeEQL/Nv4LVZovLTbDaQ0E0tH52UsI+Z2oyJFHqi7S
	 eYTNwgZUVdo9qIdOCZZwaC5hpkORmbgmjlkq6oW4OajYV1d7tq6ljAji34BioGi/cG
	 7ENTsZ+Nt3oYRMrKRv/WQDMcZA37f9z0J6r6PENJ7+li1ZjYzUUQ+KbmKw5U4ViYyF
	 U1j8FHjA7ZY2A==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,  James Prestwood
 <prestwoj@gmail.com>,  <linux-wireless@vger.kernel.org>,
  <ath10k@lists.infradead.org>,  LKML <linux-kernel@vger.kernel.org>,  Chun
 Wu <chunwu@qti.qualcomm.com>
Subject: Re: invalid vht params rate 1920 100kbps nss 2 mcs 9
References: <fba24cd3-4a1e-4072-8585-8402272788ff@molgen.mpg.de>
	<1faa7eee-ed1e-477b-940d-a5cf4478cf73@gmail.com>
	<87iky7mvxt.fsf@kernel.org>
	<37ba6cb0-d887-4fcf-b7dc-c93a5fc5900f@gmail.com>
	<875xu6mtgh.fsf@kernel.org>
	<f7faff80-864a-4411-ad28-4f1151bc1e51@quicinc.com>
	<082024ce-fdd4-4fb1-8055-6d25f7d2e524@molgen.mpg.de>
	<462c97dc-f366-4f75-9327-04d9424b819a@quicinc.com>
	<b30307fd-4417-4220-a3ac-e3e80f23105e@molgen.mpg.de>
	<ceddb62b-61dd-44c9-babd-cd375c5a147d@quicinc.com>
Date: Mon, 08 Jul 2024 13:33:08 +0300
In-Reply-To: <ceddb62b-61dd-44c9-babd-cd375c5a147d@quicinc.com> (Baochen
	Qiang's message of "Fri, 5 Jul 2024 18:51:47 +0800")
Message-ID: <87sewkcgwr.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_033315_202859_BD4BA980 
X-CRM114-Status: GOOD (  10.43  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

>>>> 2.=C2=A0 invalid vht params rate 960 100kbps nss 1 mcs 9
>>>> 3.=C2=A0 invalid vht params rate 1730 100kbps nss 2 mcs 9
>>>> 4.=C2=A0 invalid vht params rate 1920 100kbps nss 2 mcs 9
>>>
>>> OK, these are due to mismatch between host and QCA6174 firmware, we
>>> can update host to fix them.
>
> Kalle, the root cause to these three warnings are clear now and if you
> agree I can submit patches to fix them. Or I can also wait until the
> NSS 3 issue is clear.

I'm not sure why would we want to wait for the NSS 3 to be solved? Based
on my (limited) understanding I think it would be good to submit patches
for solved issues now.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

