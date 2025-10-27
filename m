Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55697CCF9E0
	for <ath10k@archiver.kernel.org>; Mon, 27 Oct 2025 17:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdKOi4YQCsGQsKdKtMIrpIeObDpZmEpfrbyf0ia0seQ=; b=jptFCMl6KEsXLJ70tJeo9ujTIb
	076S95tE3EsZ4XtagVSBXs4zLvtns1iwYjoBu7pM6BVx2b4MdqehfpEH4LDi/K3eyVEtiCRdljfaK
	xCO0JRyuOCFuu+GTsw1Lg4mU5kWrMxKG4FDmqi8T0Cp5DFw/7H5h5xEHVbC1d52zO2GdJP7CzJCTu
	bLgr+yHYj7fgcurIoLW1EtfN5INBbhO3XwtXGa2aUZeYYMBzpV/hwNRZIhhNkWfZYxS29xHQOwUJD
	BRswWEtiJPynz+Dg8UzdBUO6MmHcJWEz0boZC/tLtrhlImcRh2Zlgc+65lUGPL8tYxx53om6qjau1
	WuEZvqlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRMk-0000000EUDH-0Hbf;
	Mon, 27 Oct 2025 17:50:46 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRMh-0000000EUCY-1HSZ
	for ath10k@lists.infradead.org;
	Mon, 27 Oct 2025 17:50:44 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-475dab5a5acso15932285e9.0
        for <ath10k@lists.infradead.org>; Mon, 27 Oct 2025 10:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761587441; x=1762192241; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bdKOi4YQCsGQsKdKtMIrpIeObDpZmEpfrbyf0ia0seQ=;
        b=djv29IbWsTGpvU/8wW/p6bDk0fjahUqY7CMlFoziT6lhf4ulzu/CxKcL3jOE/iDDYS
         f9S5dHvkXIXH49ASLhCfnigIzqyqMWNfRpDsCqF6hjGl3C2ghqKUwWH5TiKmbCzNwOBW
         5YxboQ9zcOZC6cfzK2rLSi8T3M4v+gF3V/ct8aMhF4wsmDhbwqB+sB16eQUGPKCj80RA
         BP2MTpdwqBbOHgOak+VeSFg//Zr90TmYYXn6LKZqJSbTfn/hUKj4wsdJDwQDWdnt9j3o
         grN3xzfS7qN75l8QAXPkzYyaLaMFhorXOAW6qhna6Mi6AuF5w+szE+fBHgfX3KU/LY0b
         QJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761587441; x=1762192241;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bdKOi4YQCsGQsKdKtMIrpIeObDpZmEpfrbyf0ia0seQ=;
        b=rldSeChDtIh8oNI50CszPPbV8KL05XmAwM93sIuhjKd204zJ20CS5+t4dRbN8zocKW
         A734ut00xtGzG7YMNH/JLEvD+d5CTsLS+eMDLgZ0GPeDtjqOH902+WZvrXFmEGQtGOJT
         y1P0ZHBQinij5UCSH8j7rMu8r7TQrQZQ3xVz5eFqrfq5uONaMTCiJaHGKV66B/8eNnrz
         YSlnRSz3IlgS5Cps5VeB6rmpdeQzLliLN70TutlbFDpqoUD6l1OJWtTl7sX6K4mK4EQX
         aMlHxPiEHKFMoFjippY1pVDA7V4abFH6hB7WFgLnRwGkV7nya0U2pgss7OQ8zL29BH9m
         gYfg==
X-Forwarded-Encrypted: i=1; AJvYcCX/4BMfhbkKlSmzVrz/7PDI5zZ6P0/vL6frqtDXbNpQBfSUzyDNgHk8IjLNJl8Es00ABciiPm0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyidEWzSShxXbGwDgYWr1v4rVntHVqipsyqT+BWZ0s+48EzT6WA
	SCLwjX3sANkhfNpBXddrEOLfOlM7/CgTx8XqkGmN8KrSqEzb1mNSU+N/
X-Gm-Gg: ASbGnctRLDGNW65RyCh280VewsLxHipXKPFhVAyMvNdbFMHr1+smavnXLYvQl3OJaQr
	RcqeqYqTUlS/zUmI9m/foxiNlReAJIgkbxdExol+j3ZkVM0KWcU9WpuNy56d3nxRQGwxDDCd3mK
	n+iU+X6PMhxaU4my1YD9Qdlhlyl3II+HWHrcSItYLR7cqR8Z9f/JHUctWhmBAtgqqo4c+857+U8
	5pOlQqSwaCagIA4giaZY1kj+REFQB6LeLm/9a6mTo1gTfdbXIAgvWUqdHxyIGh+WC6/PWygGDIi
	ZsguxWMCCOSrcKy77At2NpJeZ1m3TuVrdxEvIMttQC6xwGzewmZMpXnZuGTNt48E5EF5PAX0sO6
	wOVgnRoKtrmAYX2vUazZnWxtEpYADci5SRm5ENQzm3hvKxpaHthK3uaws123zvEhmbzm1+nnY55
	MeX20B7hrdQlJm/EWE+HiujyvvHWWrSk0P2YDhBkK2TjNxQCo=
X-Google-Smtp-Source: AGHT+IFjedik0MVZzW42ZeTwxhByD4S2tb7wikp1vYXQLqeLHay/lDx+CGiXprGCEhGGKNb5OAwYAg==
X-Received: by 2002:a05:600c:638e:b0:477:bcb:24cd with SMTP id 5b1f17b1804b1-47717e30a86mr4189795e9.22.1761587441185;
        Mon, 27 Oct 2025 10:50:41 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:7ad3:93f6:d1b5:4923? ([2a02:168:6806:0:7ad3:93f6:d1b5:4923])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd02ce46sm179949795e9.3.2025.10.27.10.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 10:50:39 -0700 (PDT)
Message-ID: <97ee879e4f80c3746f6b79ef5ed1d45f452f8ce7.camel@gmail.com>
Subject: Re: [PATCH ath-current] Revert "wifi: ath10k: avoid unnecessary
 wait for service ready message"
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, Jeff Johnson
	 <jjohnson@kernel.org>
Cc: yannick.martin@okazoo.eu, andreas.tobler@onway.ch, 
	mathias.kretschmer@fit.fraunhofer.de, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org
Date: Mon, 27 Oct 2025 18:50:38 +0100
In-Reply-To: <20251027-ath10k-revert-polling-first-change-v1-1-89aaf3bcbfa1@oss.qualcomm.com>
References: <20251027-ath10k-revert-polling-first-change-v1-1-89aaf3bcbfa1@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-5 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_105043_372442_81BBC616 
X-CRM114-Status: UNSURE (   7.06  )
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

On Mon, 2025-10-27 at 09:49 +0800, Baochen Qiang wrote:
> This reverts commit 51a73f1b2e56b0324b4a3bb8cebc4221b5be4c7a.
>=20
> Although this commit benefits QCA6174, it breaks QCA988x and
> QCA9984 [1][2]. Since it is not likely to root cause/fix this
> issue in a short time, revert it to get those chips back.
>=20
> Compile tested only.

With this patch on top of v6.18-rc3, the following device works again:

02:00.0 Network controller: Qualcomm Atheros QCA986x/988x 802.11ac Wireless=
 Network Adapter

Tested-by: Klaus Kudielka <klaus.kudielka@gmail.com>

