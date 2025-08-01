Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2CAC87FCB
	for <ath10k@archiver.kernel.org>; Fri,  1 Aug 2025 20:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Subject:To:From:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=chvCrEMERu5Obua0/2HEShTxXo6OH0tp4El29tDjRFc=; b=XbypKA9lE7sV+O5veCzm7TaNCy
	WpPqyQOkrajupFTh2ep9yHxGkhXtnoi1ISbB8vAX1tUa1GQElRGl1dA10sRjqDXuTq+JKGSww2VaS
	ZGaRk2mvA8oQr/D1y+/nZWysUhSyG/2KLAAaxa5zRWjlKJns20KbHC7p6QYX4jMk+A1rq2zYUMqfH
	llu5aQ4R8NV//G/MeosUsPTjWsrEdFMQheB3fXezvha4eIO1PnrBvpZaHg8vFYcFrW1qIcT9GwEJK
	lbgTCVw3AqQjL/nRPNeEkPS8L3UygcsDyPTE4iaAlDlB8+FS1+KrKVlwpdfeLmybCxQiBWPEKZ1pS
	ieV1gWgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhwOL-00000006lIC-2USb;
	Fri, 01 Aug 2025 20:30:13 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhwOI-00000006lGi-2xkI
	for ath10k@lists.infradead.org;
	Fri, 01 Aug 2025 20:30:12 +0000
Received: by mail-ot1-x341.google.com with SMTP id 46e09a7af769-73e88bc3728so628579a34.0
        for <ath10k@lists.infradead.org>; Fri, 01 Aug 2025 13:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zhuapo-nl.20230601.gappssmtp.com; s=20230601; t=1754080209; x=1754685009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:subject:to:from
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=chvCrEMERu5Obua0/2HEShTxXo6OH0tp4El29tDjRFc=;
        b=ODfRBkgM06ABDMWJMyyFvfa6VivmZiIObUTFJAzU0uiUsjPuPQaVhcBqwdQ8Am09gu
         nIw5LJnWS6FTmj44yjgAQO4TzuAjwdTYVv8m25vJwCyccRC5YFCcuB04vwUFVRALYWth
         FwPTaik3G5J5zCv3q+mNi3EJgFzUdCqMcxqDpmVphM/VZZ2WbrXCpna0TkYo96SxC7Bg
         yr0XCEQoaEz/gNcrbpbMjTfCVp38DePWBr8GeoFtiYXk7tSeJkCtZjWnvVK0mGc/k7q8
         rxOnzWMAuXHACRtUHsIqYUdbsvjJMOzrqaF+1sM6Pu5seBLSmnQx+/w+ixGpRXO3cJLo
         H8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754080209; x=1754685009;
        h=content-transfer-encoding:mime-version:date:subject:to:from
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=chvCrEMERu5Obua0/2HEShTxXo6OH0tp4El29tDjRFc=;
        b=Ay+NH+fMqdnx2kgjkHalBo2WxKiERWry0Y4kREcUJWONRYpRVgbscVRwAZWmjsPGPi
         S6WXuoeBEMCDUJW/JzNe7HzAU2t9v4y+N/NceQlnKBB4ZK+gNCTe4UCk7+5DfqaLq9Vv
         Av6Ej96srJ3+fxJb71ZPl+5p9LtHFSVBJarHtGkUyuZuXnrnqgUr3ItAPLyY4CYrAX7+
         99bmRtAPnpQY9CdSMYP4FFGc6EYdq6MsfdX91ggj4WHu4YLBxcSI4fFpz3IEOqKGufBb
         yWWnlwKW9fExH+ehjL5r1XDbWd6G116HRko1DmRtHvPnOIcYqGX9gWcoXbI4EilQW6AH
         mwRw==
X-Gm-Message-State: AOJu0YxzYH9gBLwvPPHaCSacBZhYQwdA43lYR0IvG3MtjQ92GsHQXg4o
	MPXe9eWS3noSB/8OJangvpT8irQs5kusF6be43Q4Al809hTimX/k4Nx0chg6G05fvpU2Dkl+5a+
	4KaUIOZMZ8N0=
X-Gm-Gg: ASbGnctSmAiCVV/XZVIzLf58ArOEKCLDsQinbUzu5AZOT+oHzAHRuBRpf8if2B22QOv
	aiB/iVgHItykkf7CbiCc2i6An1zrDyHdBjLAYYleJkxUY6sEc4wXnZEauBGuUw/lt/cYIkg1OPk
	O5ae/yUIZ2RQWlrETljrmjqqkZUxCWL5HoeguAgV9ASslqLiCqrNmT5qVza34+rwCdfT2ImPEai
	cc3E6VP+3LWmrmXoAAs9GJT2UTApQr2HpNuNwMALmOB/xPz4vougljam/OqGwT+XBSHgDWhpEVZ
	92phcP4qOL+U3Wzj4Q+eab2bltXOA89WGRiV54Lc4mMcZ/e6zgdJTgn2iBi9IK83P7PaJLKqYw5
	BdRD5ngyd+D1zOrvrG8Kt9/05fkY=
X-Google-Smtp-Source: AGHT+IHCogw7W0oclu4B2dymY0AfIU8GVUmqq5KzueoOEqwDWeLty+uv45sq/hJrs2030htj1+EFag==
X-Received: by 2002:a05:6808:508d:b0:40b:3816:6637 with SMTP id 5614622812f47-433f03438c0mr780224b6e.24.1754080209168;
        Fri, 01 Aug 2025 13:30:09 -0700 (PDT)
Received: from xtqhadkecg.ru ([2601:2c3:c201:3ef0:74ae:e1ab:9924:a147])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43359091d86sm896425b6e.35.2025.08.01.13.30.07
        for <ath10k@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Aug 2025 13:30:08 -0700 (PDT)
Message-ID: <4c771ce9d94d2365754fb29b38f50b9e@zhuapo.nl>
From: =?utf-8?B?5aSn5ZKM6Ki85Yi4?= <noreply908@zhuapo.nl>
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Subject: =?utf-8?B?44CQ5aSn5ZKM6Ki85Yi444CR6Iez5oCl44GU56K66KqN44GP?=
	=?utf-8?B?44Gg44GV44GE77ya5Y+j5bqn5Yi26ZmQ5Zue6YG/44Gu44Gf44KB44Gu?=
	=?utf-8?B?5omL57aa44GN?=
Date: Sat, 02 Aug 2025 04:30:04 +0800
X-Priority: 3
X-Mailer: Coremail Copyright Tebie
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_133010_980644_3C24C115 
X-CRM114-Status: UNSURE (   2.06  )
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

44GK5a6i44GV44G+5ZCE5L2NDQoNCuW5s+e0oOOCiOOCiuWkp+WSjOiovOWIuOOCkuOBlOWIqeeU
qOOBhOOBn+OBoOOBjeOAgeiqoOOBq+OBguOCiuOBjOOBqOOBhuOBlOOBluOBhOOBvuOBmeOAgg0K
DQrnj77lnKjjgIHjgYrlrqLmp5jjga7lj6PluqfjgavjgaTjgYTjgabjgIHph5Hono3luoHjga7j
gqzjgqTjg4njg6njgqTjg7PjgYrjgojjgbPniq/nvarlj47nm4rnp7vou6LpmLLmraLms5Xjgavl
n7rjgaXjgY3jgIHjgZTmnKzkurrnorroqo3mg4XloLHjga7lrprmnJ/nmoTjgarmm7TmlrDmiYvn
tprjgY3jgYzlv4XopoHjgajjgarjgaPjgabjgYrjgorjgb7jgZnjgILjgZPjga7miYvntprjgY3j
ga/jgIHjgYrlrqLmp5jjga7os4fnlKPkv53orbfjga7jgZ/jgoHjgavkuI3lj6/mrKDjgafjgZnj
gIINCg0K5LiH44GM5LiA44CB5pyf5pel44G+44Gn44Gr5pu05paw5omL57aa44GN44GM5a6M5LqG
44GX44Gq44GE5aC05ZCI44CB5Y+W5byV5qmf6IO944Gr5Yi26ZmQ44GM44GL44GL44KL5Y+v6IO9
5oCn44GM44GU44GW44GE44G+44GZ44CC5LiL6KiY44Gu5pyf6ZmQ44G+44Gn44Gr5omL57aa44GN
44KS44GK6aGY44GE44GE44Gf44GX44G+44GZ44CCDQoNCuKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgCAgDQrilqAg5omL57aa44GN
5pyf6ZmQ77yaMjAyNeW5tDjmnIgz5pelIDIzOjU5ICANCuKWoCDnorroqo3jg5rjg7zjgrjvvJpo
dHRwczovL2RhbHdpYWN1dmFucy5jb20NCuKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgA0KDQrjgJDjgarjgZzjgZTmnKzkurrnorro
qo3jgYzlv4XopoHjgarjga7jgYvjgJEgIA0K5pyA6L+R44CB5LiN5q2j44Ki44Kv44K744K544KE
6KmQ5qy66KGM54K644Gr44KI44KL6KKr5a6z44GM5aKX44GI44Gm44GK44KK44CB44GK5a6i5qeY
44Gu5Y+j5bqn44KS5a6I44KL44Gf44KB44Gr5a6a5pyf55qE44Gq5oOF5aCx5pu05paw44GM5rGC
44KB44KJ44KM44Gm44GE44G+44GZ44CC44GT44KM44Gr44KI44KK44CB5LiN5q2j5Yip55So44KE
5LqI5pyf44GX44Gq44GE44Oq44K544Kv44GL44KJ44GK5a6i5qeY44Gu5aSn5YiH44Gq6LOH55Sj
44KS5a6I44KL44GT44Go44GM44Gn44GN44G+44GZ44CCDQoNCuOAkOOBlOeiuuiqjeaJi+e2muOB
jeOBq+mWouOBmeOCi+mHjeimgeOBqueCueOAkSAgDQrjg7vmiYvntprjgY3jgpLooYzjgo/jgarj
gYTloLTlkIjjgIHjg63jgrDjgqTjg7Plvozjga7lj5blvJXmqZ/og73jgoTkuIDpg6jjgrXjg7zj
g5PjgrnjgavliLbpmZDjgYzjgYvjgYvjgorjgb7jgZnjgIIgIA0K44O75YWl5Ye66YeR44Gu5L+d
55WZ44KE5Y+W5byV5YGc5q2i44Gq44Gp44GM55m655Sf44GZ44KL5Y+v6IO95oCn44KC44GC44KL
44Gf44KB44CB5b+F44Ga5pyf6ZmQ5YaF44Gr5omL57aa44GN44KS5a6M5LqG44GX44Gm44GP44Gg
44GV44GE44CCDQoNCuOBk+OBruODoeODvOODq+OBr+OCt+OCueODhuODoOmFjeS/oeWwgueUqOOB
p+OBmeOAgui/lOS/oeOBq+OBr+WvvuW/nOOBp+OBjeOBvuOBm+OCk+OBruOBp+OAgeOBlOS6huaJ
v+OBj+OBoOOBleOBhOOAgg0KDQrilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIAgIA0K55m66KGM5YWD77ya5aSn5ZKM6Ki85Yi45qCq
5byP5Lya56S+ICANCuOAkjEwMC0wMDA1IOadseS6rOmDveWNg+S7o+eUsOWMuuS4uOOBruWGhTPk
uIHnm64z55WqMeWPtyAgDQrph5Hono3llYblk4Hlj5blvJXmpa3ogIXvvJrplqLmnbHosqHli5nl
sYDplbfvvIjph5HllYbvvInnrKw0NOWPtyAgDQrilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIANCg0K5byV44GN57aa44GN44CB5aSn
5ZKM6Ki85Yi444KS44GU5oSb6aGn6LOc44KK44G+44GZ44KI44GG44GK6aGY44GE55Sz44GX5LiK
44GS44G+44GZ44CC


