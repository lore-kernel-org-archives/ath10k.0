Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E03C433FE
	for <ath10k@archiver.kernel.org>; Wed, 12 Oct 2022 14:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7WJOuGxTgXzpgPgP7Qpyg/6zWTyrxgZm12dd0jXa1F0=; b=417+9O0ij1oltp
	wYqHnsz1WY3pb7mCEsQtRbOtgQVLr9jCQvX18i1AiLBNlVimWmpHMjIy0dIchnv41uDmjXMKZk4WW
	VI2ubxLYWn8ZxcCZ1TZ0KnlAze7CS3I7LZz44na5oboSUhvGzX261ShC0ixy5eLaQmA2GtoHe0zN8
	JKiymGXvNh+DJCj8YgXnBae9NTT8emVnxDwxMnrPYcGg5BqkWgPkLoKgdSt5YNgWtHYBwfn0A/ApE
	IeoWSnFiTA9DkZyfVvvV4BpTHf0CuPApJlCBIMWCVrWpVY9fhiEXaP+cVIpE1GV+KkXtesb3Fr28J
	D2/iCeMD+88fMA5tpReA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oicoh-008PWA-LA; Wed, 12 Oct 2022 14:34:39 +0000
Received: from mail-wr1-f53.google.com ([209.85.221.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oicof-008PVB-DW
	for ath10k@lists.infradead.org; Wed, 12 Oct 2022 14:34:38 +0000
Received: by mail-wr1-f53.google.com with SMTP id j16so26518954wrh.5
        for <ath10k@lists.infradead.org>; Wed, 12 Oct 2022 07:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tor9Al5zKFy4H384gqWBoxXv/hFxksivsNXjuDpRGaw=;
        b=n3UtCfAxRjGfgY7iWUeW1OnlwXzBqxFymjpGdK8uYe8g0qWZgBmF7k5aikalEo1n0H
         9k0OnS6ejNM09+8paxxggvJKltUVLYt/AM7VxrkSlAUWL/kkaipBEkvPUdyVIr9Zcboh
         RpSF5q5Hk1BTrlM1HpaW+49jM5c2A6FvJ78tb//VkT9erVFKA3170dVWrCGYOD8ccnzk
         4zYtl0KQA973xcyzMOJxLfrfT+VkVRolrYG978FA91aGaJtes1qHQL93wqt1Ds32T1ES
         2HJbq+kGT/W3SoFJZzEh7AOSxAQNemS7mcs29NOykVbaYvOCxZIYvK8X4kE/OmgyLf7L
         xzwA==
X-Gm-Message-State: ACrzQf2UtgAhYkKuEBXYQPm3I0Adq+OMMIvAWMI/wTzm96HL4YeQuV7F
	H/deBc0vWaHZumPcayNVh5aYPK4AZ3v7E0srU2c=
X-Google-Smtp-Source: AMsMyM5q7nOEeGxpb90r8BpgH/goefH7ZF9xFGoX3X6IYwsHHjbU0d+LCLtmUkdkv+x2O6are+Nhuj0nkQQUrEbM4n4=
X-Received: by 2002:a05:6000:801:b0:230:45ad:fba6 with SMTP id
 bt1-20020a056000080100b0023045adfba6mr11248444wrb.514.1665585274073; Wed, 12
 Oct 2022 07:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221012142733.32420-1-quic_youghand@quicinc.com>
In-Reply-To: <20221012142733.32420-1-quic_youghand@quicinc.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Wed, 12 Oct 2022 07:34:22 -0700
Message-ID: <CAJ-VmomqwxD4wnuz3GJDaXUV71s_4aexY+3xYcDhXSKgo-9Zng@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath10k: Delay the unmapping of the buffer
To: Youghandhar Chintala <quic_youghand@quicinc.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_073437_472350_EB87BD9F 
X-CRM114-Status: UNSURE (   3.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Surely this should be a firmware fix/patch?



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
