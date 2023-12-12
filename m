Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DEBC4167D
	for <ath10k@archiver.kernel.org>; Tue, 12 Dec 2023 02:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmvgTcSgTSYSGQ9OhXSlfMgozAivgkoJ1Cnrtk56obw=; b=44P6hjjgNkZyFU8L2VxOwAQMNP
	1rzOJk+Nj9cNWIukSR8PDyMjOiqH9F/F8zvFxQmgXZOQW0FqlFTf7L0r8uOYRtvJVbKO4t5bL20Ok
	Gc/NLMeoF0aknMoOxcLamcMqWAXvSIZ7KNIurJjK+oGA0CuzVlXkwuQHNY1qvhWtSsXLboPbtEhs9
	7GCwEHBDW3MtGi0++DNprRty6204WwCWThTI9NeNYKUgMQSzPSD6Rn/J+Os1Q6xHylKIxoZTI3Ipn
	s3rZv66uEdlFeWqLaJaBgMIprUHdoagOmyK0TUR4s9ROROpHStIoQAG3g4YL5vevHJbCr6ovqW821
	NeoswUeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCsVH-00AWUb-2O;
	Tue, 12 Dec 2023 02:28:11 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCsV8-00AWKJ-1E;
	Tue, 12 Dec 2023 02:28:06 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5d747dbf81eso44773707b3.1;
        Mon, 11 Dec 2023 18:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702348076; x=1702952876; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmvgTcSgTSYSGQ9OhXSlfMgozAivgkoJ1Cnrtk56obw=;
        b=JoyVPRigCJ1RfVcpB2yAE9w6it8r+pBWGDESapr4EwPnq0EqoSHis6i4KQA8vBXh4T
         AyHWiLEKaftNCBwEHXx8QkCD8DXr6oOiZym6NQcCnqhztun5bkUBXmxvMOwBrnYYXD/n
         lQrCEuKQ/NCY9LSnWCX0JthVW3LWAllfa0z6BPbF/OzQI80MlvNm/c1KPnMYe7oW5rkw
         mlw9u3sb88gdL956jqt44zYxR8f2gUmZbup9X1FM49MD/CnD6ZmFjKu++c+lrFlNa18Q
         QLMnLMb/E/D9XdfbrZgzdrJGnIYaCXEOC4x7pJSh4HeJN+D0Me1VY8FolgkQ1zKfQvZp
         la0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702348076; x=1702952876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HmvgTcSgTSYSGQ9OhXSlfMgozAivgkoJ1Cnrtk56obw=;
        b=RD9ATo4nXSU+yduO0mBGa1LCgERrWwNfDJ/uG890kbpjJKwUlGHzsAjgR3aob4z7On
         AtL75N4X8MGq8MzemHQp4frfe0fgw43aCVZptE31bL+41+pnuBwQP4zxyCekLpf4pYon
         9td5Wbv19aa9tqBJOHFY6uoVaps4QhfBu/JVmwOf2qXthsMl4WgjSShonJCoiHGmgNF7
         jEFy2sywIYZEeWuc00pyOFj6ywILmR8PPJgZzf8rfrfPFYFUvezRC0t9wh8mr0+Ni9eQ
         NdWAicSSEytk5pHGa78/NcLyXFkKgPh6jDsXsx+tiGn+zZubf8V0nyM3eZC1kROkW4hS
         wnRA==
X-Gm-Message-State: AOJu0YwFfCXybEo6ikDJ0wa4pFFcIJNuwxNywF6Gv0jNnP2vbqmDvr/9
	DQ9Klg52iMdZphPPR8EH8do=
X-Google-Smtp-Source: AGHT+IFPs4AvQxtYv4UrJlD5lGh/BMqsDvh12ZnXOoQbI3s9B0hPdqcJ7FPe01OhhQlwKaBiv0CCJg==
X-Received: by 2002:a81:a505:0:b0:5d7:1941:aa7 with SMTP id u5-20020a81a505000000b005d719410aa7mr4037805ywg.66.1702348076388;
        Mon, 11 Dec 2023 18:27:56 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:38aa:1c88:df05:9b73])
        by smtp.gmail.com with ESMTPSA id a200-20020a0dd8d1000000b005d35a952324sm3448999ywe.56.2023.12.11.18.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 18:27:55 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Disseldorp <ddiss@suse.de>,
	Edward Cree <ecree.xilinx@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Hans de Goede <hdegoede@redhat.com>,
	Hugh Dickins <hughd@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jens Axboe <axboe@kernel.dk>,
	Jiri Pirko <jiri@resnulli.us>,
	Jiri Slaby <jirislaby@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Karsten Graul <kgraul@linux.ibm.com>,
	Karsten Keil <isdn@linux-pingi.de>,
	Kees Cook <keescook@chromium.org>,
	Leon Romanovsky <leon@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Martin Habets <habetsm.xilinx@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Nicholas Piggin <npiggin@gmail.com>,
	Oliver Neukum <oneukum@suse.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Rich Felker <dalias@libc.org>,
	Rob Herring <robh@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wenjia Zhang <wenjia@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	GR-QLogic-Storage-Upstream@marvell.com,
	alsa-devel@alsa-project.org,
	ath10k@lists.infradead.org,
	dmaengine@vger.kernel.org,
	iommu@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-net-drivers@amd.com,
	linux-pci@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	mpi3mr-linuxdrv.pdl@broadcom.com,
	netdev@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Jan Kara <jack@suse.cz>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Matthew Wilcox <willy@infradead.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
	Alexey Klimov <klimov.linux@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v3 02/35] lib/find: add test for atomic find_bit() ops
Date: Mon, 11 Dec 2023 18:27:16 -0800
Message-Id: <20231212022749.625238-3-yury.norov@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231212022749.625238-1-yury.norov@gmail.com>
References: <20231212022749.625238-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_182802_444358_118AF559 
X-CRM114-Status: GOOD (  14.19  )
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

Add basic functionality test for new API.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 lib/test_bitmap.c | 61 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
index 65f22c2578b0..277e1ca9fd28 100644
--- a/lib/test_bitmap.c
+++ b/lib/test_bitmap.c
@@ -221,6 +221,65 @@ static void __init test_zero_clear(void)
 	expect_eq_pbl("", bmap, 1024);
 }
 
+static void __init test_find_and_bit(void)
+{
+	unsigned long w, w_part, bit, cnt = 0;
+	DECLARE_BITMAP(bmap, EXP1_IN_BITS);
+
+	/*
+	 * Test find_and_clear{_next}_bit() and corresponding
+	 * iterators
+	 */
+	bitmap_copy(bmap, exp1, EXP1_IN_BITS);
+	w = bitmap_weight(bmap, EXP1_IN_BITS);
+
+	for_each_test_and_clear_bit(bit, bmap, EXP1_IN_BITS)
+		cnt++;
+
+	expect_eq_uint(w, cnt);
+	expect_eq_uint(0, bitmap_weight(bmap, EXP1_IN_BITS));
+
+	bitmap_copy(bmap, exp1, EXP1_IN_BITS);
+	w = bitmap_weight(bmap, EXP1_IN_BITS);
+	w_part = bitmap_weight(bmap, EXP1_IN_BITS / 3);
+
+	cnt = 0;
+	bit = EXP1_IN_BITS / 3;
+	for_each_test_and_clear_bit_from(bit, bmap, EXP1_IN_BITS)
+		cnt++;
+
+	expect_eq_uint(bitmap_weight(bmap, EXP1_IN_BITS), bitmap_weight(bmap, EXP1_IN_BITS / 3));
+	expect_eq_uint(w_part, bitmap_weight(bmap, EXP1_IN_BITS));
+	expect_eq_uint(w - w_part, cnt);
+
+	/*
+	 * Test find_and_set{_next}_bit() and corresponding
+	 * iterators
+	 */
+	bitmap_copy(bmap, exp1, EXP1_IN_BITS);
+	w = bitmap_weight(bmap, EXP1_IN_BITS);
+	cnt = 0;
+
+	for_each_test_and_set_bit(bit, bmap, EXP1_IN_BITS)
+		cnt++;
+
+	expect_eq_uint(EXP1_IN_BITS - w, cnt);
+	expect_eq_uint(EXP1_IN_BITS, bitmap_weight(bmap, EXP1_IN_BITS));
+
+	bitmap_copy(bmap, exp1, EXP1_IN_BITS);
+	w = bitmap_weight(bmap, EXP1_IN_BITS);
+	w_part = bitmap_weight(bmap, EXP1_IN_BITS / 3);
+	cnt = 0;
+
+	bit = EXP1_IN_BITS / 3;
+	for_each_test_and_set_bit_from(bit, bmap, EXP1_IN_BITS)
+		cnt++;
+
+	expect_eq_uint(EXP1_IN_BITS - bitmap_weight(bmap, EXP1_IN_BITS),
+			EXP1_IN_BITS / 3 - bitmap_weight(bmap, EXP1_IN_BITS / 3));
+	expect_eq_uint(EXP1_IN_BITS * 2 / 3 - (w - w_part), cnt);
+}
+
 static void __init test_find_nth_bit(void)
 {
 	unsigned long b, bit, cnt = 0;
@@ -1273,6 +1332,8 @@ static void __init selftest(void)
 	test_for_each_clear_bitrange_from();
 	test_for_each_set_clump8();
 	test_for_each_set_bit_wrap();
+
+	test_find_and_bit();
 }
 
 KSTM_MODULE_LOADERS(test_bitmap);
-- 
2.40.1


