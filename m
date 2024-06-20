Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BB4C2BB85
	for <ath10k@archiver.kernel.org>; Thu, 20 Jun 2024 17:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93DcC67mVeY/+nPj/RabbHCmpdvAxDoR+WvyjbP4Fv8=; b=yGN4J0Zwt+gh00EYEQ4vSfe9lh
	ZuP9QDjC1uoVJyez1PE/Ar3saN70Arc/gdwU5XelLX6KwUMj9TfJeJnEJck+mcWvhdu45q/6u/VkL
	XUwkA4lcRRZf2Rseiv8xT9fg+dtpnN/cBxRahmpZweQ3jHm+RSpoOoTCLWEwjZvvApjSrDIoULIMJ
	+Od9LmzwMzgeBjK5Fn7lPWOhCdFFtxP15pwYRJFeO/CIELUPL7Ekt/jWOhBa+6wjYVlUqvUbnFnbG
	ySTLyz0lfsqXOgu3SgtJuVexqt4FIeloM2cbyVTFRGl4DNXHd1yASEFSHmvFd66AduVqT6bIulejy
	+fp9E0jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKM2J-00000006ABT-17nK;
	Thu, 20 Jun 2024 17:57:27 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKM27-00000006A3k-30dP;
	Thu, 20 Jun 2024 17:57:17 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f70c457823so9316025ad.3;
        Thu, 20 Jun 2024 10:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718906235; x=1719511035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93DcC67mVeY/+nPj/RabbHCmpdvAxDoR+WvyjbP4Fv8=;
        b=RyLjtcEH3JpdWVdDx0pY/nrb8wdjPkFY8hMjT5JYcR7C9td6/ecG3pV/X8HfxWyFHG
         kYuI17Ak5fKs/r8wjmiMC+8q3nG7j0lBXpcrY1grQI8XKsKUOpEzfl6sh8Vo5EsfemNj
         45PaW2itI3gcsq9g9ZWgfgObOeCCae2PVOoajdzS2TihBYwOpoBB6ib66cMYrEMdjbJn
         21w0VM8+jl9WSWEFo4Ikx3TN3nMlMRhg7JO06EpYdXJESVhp6PT4pJrQtnNetzCb6aWj
         arnNxD7D3CBztR8lojAbiHmC88lGJg54qI1EwkP53w7xU7SM35gdQgoq6Su3MqPcp9m1
         Lv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906235; x=1719511035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93DcC67mVeY/+nPj/RabbHCmpdvAxDoR+WvyjbP4Fv8=;
        b=fHWahufHp5ZM9iO3aQcoOJ0bGo95z2+LmwMX+UaBl+qR0byzaKIp+LDGNWUVQYmv96
         YDT5VMqTmF90Y7LplAVgFqKX0HoLu6QFESUyAabiOjvRokwKlNBTih+Hnksq1An/nRPq
         dPDHSTCyplLNFetR/1MMmvLKeC5ovSGSEYnrPmw6Ez7lY6Heg8ZSQvCsHyFANbZV8yg1
         Ghmsk0j2D1gS9k0cgayF//LTUFVQJ+fFGL5bU+4T2VNRlX3rd7hz08M0QxEWYhzW8LbF
         HgtZ7NzQweEAY8ac/zmgxdsHtPSytCX+BeY7eht4tIPxPcEYHruz85gs4Tq5JX83CqTh
         1eww==
X-Forwarded-Encrypted: i=1; AJvYcCWiSQ7b0W2UVOj2grGU+uzm8wp5LqlSvhZulDkDivOc4yYLdXkPi3jRMxlzhgY/k+wAOyIE2GZhhDEHaUdxMU9hKv5c87zvYHxwIrdW6tXIkQ3PNziwAGneiKh1ZB5VdLzyo8p5TlQBiIHAh+Af8yCh
X-Gm-Message-State: AOJu0Yy0zR/ijfoz7tvNI3Fg0ANN/FtX8txd6hJusuvRdCdj5/fIQI7k
	U6R30NSUTAuMwNviGoa/Mk8uDQuAv9RNrQf0JroCExRu0edFb9dJ
X-Google-Smtp-Source: AGHT+IF9ITZbJ7vVNEYTX8RCffN7BEtSM9imchEPcbZOZxImDJdvzQARxKbAqm1aXg+Hi0vjNW3ABQ==
X-Received: by 2002:a17:902:f687:b0:1f6:fcd9:5b86 with SMTP id d9443c01a7336-1f9aa3ecca8mr64371665ad.12.1718906234591;
        Thu, 20 Jun 2024 10:57:14 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9d28ce155sm15196715ad.259.2024.06.20.10.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:57:14 -0700 (PDT)
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
	Alexey Klimov <alexey.klimov@linaro.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Jan Kara <jack@suse.cz>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v4 02/40] lib/find: add test for atomic find_bit() ops
Date: Thu, 20 Jun 2024 10:56:25 -0700
Message-ID: <20240620175703.605111-3-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240620175703.605111-1-yury.norov@gmail.com>
References: <20240620175703.605111-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_105715_962235_B993CA83 
X-CRM114-Status: GOOD (  15.27  )
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
 lib/test_bitmap.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
index 65a75d58ed9e..405f79dd2266 100644
--- a/lib/test_bitmap.c
+++ b/lib/test_bitmap.c
@@ -6,6 +6,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/bitmap.h>
+#include <linux/find_atomic.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -221,6 +222,65 @@ static void __init test_zero_clear(void)
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
@@ -1482,6 +1542,8 @@ static void __init selftest(void)
 	test_for_each_clear_bitrange_from();
 	test_for_each_set_clump8();
 	test_for_each_set_bit_wrap();
+
+	test_find_and_bit();
 }
 
 KSTM_MODULE_LOADERS(test_bitmap);
-- 
2.43.0


