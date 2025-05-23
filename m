Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70172C54EDA
	for <ath10k@archiver.kernel.org>; Fri, 23 May 2025 17:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+L9RjaLh+JUJfV2DrKsGxGJ+0F3cQN9zcS4XZ0t5jHc=; b=TUGk9ovaamxCYTpjXRZuntP8Zl
	05nPDBHC4uWZz1HQbq4b7ypy+XrVxH+73vNGzgwGeIU2a/d36w4vm4bgtUGs4j2IsDn3Kbiz/zr7F
	GKwShqO9W69bfth0DN7GSg95FyllbpoO9UnLL0ZAoEoetLSP7loy7kEn88l4pTYxsfcxF8temL1NO
	vM/MhL5fgvBtpgxTnisOb10X5BDnUu6Bl5KZEo6WIzHkp9VNkeVBGYOBh8c9snm8mgIR3aRpXlVOI
	NygykdU3QBsq5W7NFFWpTZ5WqU4F3DPR6xl8zeWuWE8/iNeqcrMNcrUk92zQrEz0DxLFe1ArECoz1
	0utgFC2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIW7P-00000004Wmi-1oH3;
	Fri, 23 May 2025 17:23:39 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVs2-00000004UVv-1oKz
	for ath10k@lists.infradead.org;
	Fri, 23 May 2025 17:07:47 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-47690a4ec97so408071cf.2
        for <ath10k@lists.infradead.org>; Fri, 23 May 2025 10:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748020064; x=1748624864; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+L9RjaLh+JUJfV2DrKsGxGJ+0F3cQN9zcS4XZ0t5jHc=;
        b=feHLjm/q/X9asm1xCD7gI+9xFO55ahmxOQBKnJM/UlzAL9dVtOv2gXQFRaelfNGlni
         ounenN1Ky3m8bWGapNzvuk606XUDBUYnXZfgw/ETbfwhSeHtzdrd8cwSiUhoC6cEdWIC
         pN2cxxkN/0btk/dFBGtiISNewlRBVUpcXu7ZubpZOt5n/1rI/4J5KXkv/mlUccqCM1EQ
         SBeYMfoikti8WbJQsqIagO2tk2yTvpZbuwcb6lgMouhmEzwplobz/YZpfUuYZ6a9xMiA
         Jfi4A1c+kKLieuznZ+5v5XK30sSrDNvU1fyfLwMcNplJ6b77dploJTyoDnDyfDdMXat7
         5EVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748020064; x=1748624864;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+L9RjaLh+JUJfV2DrKsGxGJ+0F3cQN9zcS4XZ0t5jHc=;
        b=b1ojW0yy1jLgV7i5RWflqKJp5KUtd7jX/Ea7dsyrGkx75fZCozvceWzl/dZPhH3Hm+
         LJXf+zLQZcPhx1JkBwuonadfzbLHCslkT/byycSOMMj0ntz6o9iXE9Dcee5EAAWv6TUp
         KEZs6pNbhv4tJiiQbeefE5VMxtDIrM7WN/JHdxN7oWpbCFcQCaxCRbfCnC+aL0wpWV7h
         +5xc8o7HB4NI3Me0AeBE2dos4x9XrS2KZ73p885QKKFTKoDWcEfYYCwgF88FusavqeYb
         vlsSyOXMvC3sONzi0zjpB/cIEsliEc2XLxO+iKTpLgJllf1aLCmipbx+XwMZsfLG9xQU
         DMjg==
X-Gm-Message-State: AOJu0Ywd2rjAQmygDiUexO/00xcb1NJxKi1yFC3qgn+tpMy2fpMMShtc
	/RnI7F9MJyt50M/gfPsCCJV479Q6+8AMQVsp2r40oKPapL9dKqM1UdQY/14k8Q==
X-Gm-Gg: ASbGncsxJzGirmx1yMiPAANnYxHg/GNBLpt/HMyO31uubXJC1plZ53Wu2HfW/OOuL9l
	X04Z6NykUw5gDJqfVJW4PNfcq22PFf+uAGMSs+n25L0zRnIO6nPx8fCWK3HFJ6tWG3rq6BFscy8
	cDk1wQx4L1ISPxmMGOBBVgzwzjhsYeVUyhigj3tyjp1PK5UfOKI9LjHsxwrdSnCx9K73L4baXkO
	qHGhvYeHYJxCQtgriU3UlOfA/dp67G/MM+ISyr0GSmBZDFRWvN5+Q+dLd9czGhHav8Lza2xsh5c
	U+LCeBpihdhtrs6/F3kp1YbdOqV7c/8++MLcp8F8qGpgtSPJ6CgI
X-Google-Smtp-Source: AGHT+IGgPOxi9NNuHjMWwQwXI36LImmPtDvHUNlZUV65+yoNyU4FyPAXyAUMx11p3lOaTyZaU11ZLQ==
X-Received: by 2002:a05:622a:1f09:b0:494:a057:81a7 with SMTP id d75a77b69052e-494ae36c59dmr528162431cf.16.1748020064467;
        Fri, 23 May 2025 10:07:44 -0700 (PDT)
Received: from [10.201.20.170] ([71.181.84.66])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49b8acabd14sm44023811cf.80.2025.05.23.10.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 10:07:43 -0700 (PDT)
Message-ID: <bd2f333e-28e3-46bb-8b2b-b61537ea6288@gmail.com>
Date: Fri, 23 May 2025 10:07:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: ath10k@lists.infradead.org
Cc: "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>
From: James Prestwood <prestwoj@gmail.com>
Subject: DMA write/fault when 802.11w is enabled
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_100746_474547_05C3A684 
X-CRM114-Status: UNSURE (   4.89  )
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

Hi,

After enabling 802.11w on some internal networks I noticed all of our 
ath10k client devices now show this during and just after every 
connection/roam. It started immediately after flipping to 802.11w on the 
APs, for every client running ath10k.

They are all running the QCA6174 hw3.2 WLAN.RM.4.4.1-00288-

I don't see it causing any delays or issues in the connection or 
afterwards, but it caught me off guard and was slightly concerning. 
Anyone else notice this with 802.11w enabled on the QCA6174?

kernel: DMAR: DRHD: handling fault status reg 2
kernel: DMAR: [DMA Write NO_PASID] Request device [02:00.0] fault addr 
0xffe4c000 [fault reason 0x05] PTE Write access is not set


