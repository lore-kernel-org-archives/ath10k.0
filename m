Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65995CFD315
	for <ath10k@archiver.kernel.org>; Tue, 25 Nov 2025 07:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZtbG4XYsDqlCvYnjir3vKy2J6xrwor92yZ1D35ysmU=; b=na//+ZZ79OUjWDjhfRedmnJctA
	neB8jRKoqdP5cFgiY0EcKhzf9UYnqMzkLSSf3WLe+wqoYQVHX/1cwodwWuzJy7cjqTstK8hJ/XCr/
	F13Is8gNoTP1ppRz/AuwdpX+e1XW6tZURtTTjfijDcFdlBk6o7T7gGSnkspgkfF9NtyZnvABTAiV6
	SsZP5Exj6ldwgfXkn0T6SHNCt2CgXeNfUTBZCuuBM3Re/KuBRmZPcm0n7FzXnta/z1LDsB+mu+v8C
	JkBZZmmPRWaKZCLaW89n8d1ZVGuwxKTq0uQTB5hdBeNrWmGtbLHO345kXCSaUM4TzW43CVF+G6+KF
	z4VXjiCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNn50-0000000Cr25-200x;
	Tue, 25 Nov 2025 07:03:14 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNn4x-0000000Cr1b-3MHy
	for ath10k@lists.infradead.org;
	Tue, 25 Nov 2025 07:03:13 +0000
Message-ID: <33a8c6be-6946-41e3-aad7-fcd572e32a66@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764054189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ZtbG4XYsDqlCvYnjir3vKy2J6xrwor92yZ1D35ysmU=;
	b=JRPRAfPopHyckZmsphbNveFeTSf0JNPgGMy25aQbcuAqaxGi2159ssntskqldZoZmHfZZX
	I+9ae27F+jIxuY+/2YkGiTHtPLfzt1ViLcyn63hG9RU5h4yICwGDZseelZqAKRzUNAdxlf
	7GkRDfxT8mOTRCAeqWzrjwhky4fkHodOWoJLA+Pk0Aga6MtN3BVrYLpbQ6AlkCLQ5tCUr6
	UFWflGh3lHjYPs57QiaRHSXMvOLJJfxoPe+ihmQPDq7VPKfAYZYXxW9VYFYIOVVycVQKFu
	MIuaCHz4oC6Zeg9+gGlmXFL+l9fN0r4+6LnuXt3MpfQkQaSw411wTLTP3zyiwA==
Date: Mon, 24 Nov 2025 23:03:02 -0800
MIME-Version: 1.0
To: devnull+david.ixit.cz@kernel.org
Cc: amit.pundir@linaro.org, andersson@kernel.org, ath10k@lists.infradead.org,
 conor+dt@kernel.org, david@ixit.cz, devicetree@vger.kernel.org,
 jjohnson@kernel.org, johannes@sipsolutions.net, konradybcio@kernel.org,
 krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 phone-devel@vger.kernel.org, robh@kernel.org
References: <20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz>
Subject: Re: [PATCH v2 0/3] ath10k: Introduce a devicetree quirk to skip host
 cap QMI requests
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Paul Sajna <sajattack@postmarketos.org>
In-Reply-To: <20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_230312_018434_DD7FD089 
X-CRM114-Status: UNSURE (   3.12  )
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

Also required for 
https://lore.kernel.org/all/20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org/T/#m90e8087d4388e588b71a0eff01b88f1721f73b73


