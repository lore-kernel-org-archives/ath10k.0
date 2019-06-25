Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfbzb-0006O6-NJ
 for ath10k@lists.infradead.org; Tue, 25 Jun 2019 03:19:37 +0000
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5P36w2I025997
 for <ath10k@lists.infradead.org>; Mon, 24 Jun 2019 23:19:33 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tb9r3ur22-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ath10k@lists.infradead.org>; Mon, 24 Jun 2019 23:19:32 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <ath10k@lists.infradead.org> from <alastair@au1.ibm.com>;
 Tue, 25 Jun 2019 04:19:31 +0100
From: "Alastair D'Silva" <alastair@au1.ibm.com>
Subject: [PATCH v4 1/7] lib/hexdump.c: Fix selftests
Date: Tue, 25 Jun 2019 13:17:20 +1000
In-Reply-To: <20190625031726.12173-1-alastair@au1.ibm.com>
References: <20190625031726.12173-1-alastair@au1.ibm.com>
MIME-Version: 1.0
Message-Id: <20190625031726.12173-2-alastair@au1.ibm.com>
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: alastair@d-silva.org
Cc: linux-fbdev@vger.kernel.org, Stanislaw Gruszka <sgruszka@redhat.com>, Petr Mladek <pmladek@suse.com>, David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org, linux-scsi@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, ath10k@lists.infradead.org, intel-gfx@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Tom Lendacky <thomas.lendacky@amd.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-fsdevel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Benson Leung <bleung@chromium.org>, Kalle Valo <kvalo@codeaurora.org>, Karsten Keil <isdn@linux-pingi.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, David Laight <David.Laight@ACULAB.COM>, Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>

From: Alastair D'Silva <alastair@d-silva.org>

The overflow tests did not account for the situation where no
overflow occurs and len < rowsize.

This patch renames the cryptic variables and accounts for the
above case.

The selftests now pass.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 lib/test_hexdump.c | 48 +++++++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/lib/test_hexdump.c b/lib/test_hexdump.c
index 5144899d3c6b..bef97a964582 100644
--- a/lib/test_hexdump.c
+++ b/lib/test_hexdump.c
@@ -163,45 +163,53 @@ static void __init test_hexdump_overflow(size_t buflen, size_t len,
 {
 	char test[TEST_HEXDUMP_BUF_SIZE];
 	char buf[TEST_HEXDUMP_BUF_SIZE];
-	int rs = rowsize, gs = groupsize;
-	int ae, he, e, f, r;
-	bool a;
+	int ascii_len, hex_len, expected_len, fill_point, ngroups, rc;
+	bool match;
 
 	total_tests++;
 
 	memset(buf, FILL_CHAR, sizeof(buf));
 
-	r = hex_dump_to_buffer(data_b, len, rs, gs, buf, buflen, ascii);
+	rc = hex_dump_to_buffer(data_b, len, rowsize, groupsize, buf, buflen,
+				ascii);
 
 	/*
 	 * Caller must provide the data length multiple of groupsize. The
 	 * calculations below are made with that assumption in mind.
 	 */
-	ae = rs * 2 /* hex */ + rs / gs /* spaces */ + 1 /* space */ + len /* ascii */;
-	he = (gs * 2 /* hex */ + 1 /* space */) * len / gs - 1 /* no trailing space */;
+	ngroups = rowsize / groupsize;
+	hex_len = (groupsize * 2 /* hex */ + 1 /* spaces */) * ngroups
+		  - 1 /* no trailing space */;
+	ascii_len = hex_len + 2 /* space */ + len /* ascii */;
+
+	if (len < rowsize) {
+		ngroups = len / groupsize;
+		hex_len = (groupsize * 2 /* hex */ + 1 /* spaces */) * ngroups
+		  - 1 /* no trailing space */;
+	}
 
-	if (ascii)
-		e = ae;
-	else
-		e = he;
+	expected_len = (ascii) ? ascii_len : hex_len;
 
-	f = min_t(int, e + 1, buflen);
+	fill_point = min_t(int, expected_len + 1, buflen);
 	if (buflen) {
-		test_hexdump_prepare_test(len, rs, gs, test, sizeof(test), ascii);
-		test[f - 1] = '\0';
+		test_hexdump_prepare_test(len, rowsize, groupsize, test,
+					  sizeof(test), ascii);
+		test[fill_point - 1] = '\0';
 	}
-	memset(test + f, FILL_CHAR, sizeof(test) - f);
+	memset(test + fill_point, FILL_CHAR, sizeof(test) - fill_point);
 
-	a = r == e && !memcmp(test, buf, TEST_HEXDUMP_BUF_SIZE);
+	match = rc == expected_len && !memcmp(test, buf, TEST_HEXDUMP_BUF_SIZE);
 
 	buf[sizeof(buf) - 1] = '\0';
 
-	if (!a) {
-		pr_err("Len: %zu buflen: %zu strlen: %zu\n",
-			len, buflen, strnlen(buf, sizeof(buf)));
-		pr_err("Result: %d '%s'\n", r, buf);
-		pr_err("Expect: %d '%s'\n", e, test);
+	if (!match) {
+		pr_err("rowsize: %u groupsize: %u ascii: %d Len: %zu buflen: %zu strlen: %zu\n",
+			rowsize, groupsize, ascii, len, buflen,
+			strnlen(buf, sizeof(buf)));
+		pr_err("Result: %d '%-.*s'\n", rc, (int)buflen, buf);
+		pr_err("Expect: %d '%-.*s'\n", expected_len, (int)buflen, test);
 		failed_tests++;
+
 	}
 }
 
-- 
2.21.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
