Return-Path: <SRS0=RSRu=PC=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB47C433F5
	for <ath10k@archiver.kernel.org>; Thu, 14 Oct 2021 07:56:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E2DE61027
	for <ath10k@archiver.kernel.org>; Thu, 14 Oct 2021 07:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E2DE61027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=veo.co
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=jKtz3hO7uKrL/6hMr0Ab7n1xMA8q8/r7aUrlfUXRLHE=; b=gzR
	JTk3NfJhjryRhzXtGYzcKdIOYop+eDbnJO+T1nJKb6fFnb4gNLmQ5vJ1r26RjIDEgvGa/vTEE1Nqk
	tsZRzVsCXnYuIXrU0BIfm+K9JuWxYJrJMhIVVdIpxv8eSOrNiNYIuDcgPYhiD/CUcBmOc2MwF/liY
	vlQQujMYonWjCIOmi1Al0QeJNr/5DOcPxbttrsfLnOJBk0Oev/s0+V7t+4Q9uijJ06vfLJmi2uZGA
	c0fJhoRFq4L0xKrmDZS4mGO11/iPSWNQJ9fdnQqx0SbyMLSZelyYhOd7QF+REOvpd8zDSMZqZfdcl
	ag0r7i49sUnuzhjDP+olpT6H3FFkN4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mavbO-0020Fd-3w; Thu, 14 Oct 2021 07:56:34 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mavbL-0020Cs-Hp
 for ath10k@lists.infradead.org; Thu, 14 Oct 2021 07:56:33 +0000
Received: by mail-lf1-x12b.google.com with SMTP id x27so23008427lfa.9
 for <ath10k@lists.infradead.org>; Thu, 14 Oct 2021 00:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=veo.co; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=lY1WRin5Q+3PgDrGeKkCu6fB23LJw+u9GXJs0Zdckuw=;
 b=iUjKI8xo2KJyGNZXzsrMTHbhumvEcjsZ7ub7mYyJcWpxwVotez5vlSbJn46vj42ySW
 Ffr+Y7KhPinWl7Q6dh1wcy7vN+qu5OU+zXxWttuk8eh0G4OvDnC5W8ipEEx5blWH4qhe
 YvBZrws4dIGiLkU9BM6BvEsCcF13XjYP4lvYOmgwfDZ60EDegH5UmOpVD2YnKx+dp61Z
 l7VOOOWBUYpxMCtOPwI+VgJrvnz6nmwBoFSWi/dFU/bJn5B6qBGrZ1pn5JE+x9f65b5j
 jXqtnvJ61bGyd4YFD9uTFdJU5YFHXx8x1JAcM01QpyfsTFfwi4PQot9brybxEY4UH2jX
 5zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=lY1WRin5Q+3PgDrGeKkCu6fB23LJw+u9GXJs0Zdckuw=;
 b=wOjuNS9HEAdXRifoCrUvDmovlzR27bIiuyuSD2LMZjkxJAE7EXT/XLxxXbIsBWZ70X
 FJUBi6DO15QfEkTxBGAPNZtoCEo+LoXIb1kSPg2lT6kmMktxiaxTunKDdV1K+N4ziK4P
 iXSxi6ElvrwHIDAkzynMmm2Ca2HJoRn/Xxeh0On/j41Bt70cAHTrRBwBtfmSDuhD6Dcc
 WOSSyBW1UKF2GPYClajQoNMaHuCHCtcHZ0FdvFL6zonTrYfvTQ2jiMHs9gXtX+rfhkKH
 +p2hbvoEQAIN4zxRpJIENcBZulbL1Rz4BE5g5EluF7kJ0N5l1MLrpI+ge5LIaBJiOVvf
 OeXg==
X-Gm-Message-State: AOAM532UIwRs8OkQnlMSk3YHhazJf3vEwEckxQxGUac9iBR8/JVpmpPj
 uA877O0Llp6/qOef0FXrQzV4Q+fEpL7OqmvZu5qPWGmlvBuHPw==
X-Google-Smtp-Source: ABdhPJwL4MqEY+39q1U6AHfUKJIUN6f8QVszQoYfcNrexOtvaPQ5aa0mD6mJkjnBDQrhkzg0+9s6jB1MZKHbAsiVes4=
X-Received: by 2002:a05:6512:a93:: with SMTP id
 m19mr3711108lfu.574.1634198189241; 
 Thu, 14 Oct 2021 00:56:29 -0700 (PDT)
MIME-Version: 1.0
From: Jens Christian Hillerup <jc@veo.co>
Date: Thu, 14 Oct 2021 09:56:18 +0200
Message-ID: <CADQ=1VJ4B4BB7kNZrcxByyx=--fv8xSFZ+yP9czX25qYJ3eUaQ@mail.gmail.com>
Subject: Network interface taking a long time to come up
To: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_005631_631337_C5424067 
X-CRM114-Status: GOOD (  13.63  )
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

Hello

I'm trying to get a QCA6174-based PCIe card online on the NVIDIA Tegra
platform. Running kernel 4.9.253-l4t-r32.6. The card is detected and
visible in lspci (+ lsusb for the Bluetooth parts), but after loading
the ath10k_pci driver it takes about 2 minutes for the network
interface to actually appear.

In fact, it takes so close to 120 seconds that I believe it could be
due to some kind of timeout.

    $ ls -1 /lib/firmware/ath10k/QCA6174/hw3.0/
    board-2.bin
    board.bin
    firmware-4.bin
    firmware-5.bin
    firmware-6.bin
    firmware-sdio-6.bin

    $ dmesg
    <snip>
    [    9.932518] ath10k_pci 0004:01:00.0: enabling device (0000 -> 0002)
    [    9.933364] ath10k_pci 0004:01:00.0: pci irq msi oper_irq_mode
2 irq_mode 0 reset_mode 0
    [   10.211615] ath10k_pci 0004:01:00.0: Direct firmware load for
ath10k/pre-cal-pci-0004:01:00.0.bin failed with error -2
    [   10.211835] ath10k_pci 0004:01:00.0: Falling back to user helper
    <snip>
    [   71.009583] ath10k_pci 0004:01:00.0: Direct firmware load for
ath10k/cal-pci-0004:01:00.0.bin failed with error -2
    [   71.009612] ath10k_pci 0004:01:00.0: Falling back to user helper
    [  132.469576] ath10k_pci 0004:01:00.0: qca6174 hw3.2 target
0x05030000 chip_id 0x00340aff sub 11ad:0513
    [  132.469588] ath10k_pci 0004:01:00.0: kconfig debug 0 debugfs 1
tracing 0 dfs 0 testmode 0
    [  132.470831] ath10k_pci 0004:01:00.0: firmware ver
WLAN.RM.4.4.1-00157-QCARMSWPZ-1 api 5 features wowlan,ignore-otp,mfp
crc32 90eebefb
    [  132.550108] ath10k_pci 0004:01:00.0: board_file api 2 bmi_id
N/A crc32 318825bf
    [  134.617280] ath10k_pci 0004:01:00.0: Unknown eventid: 3
    [  134.638886] ath10k_pci 0004:01:00.0: Unknown eventid: 118809
    [  134.643255] ath10k_pci 0004:01:00.0: Unknown eventid: 90118
    [  134.655353] ath10k_pci 0004:01:00.0: htt-ver 3.60 wmi-op 4
htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
    [  134.748641] ath: EEPROM regdomain: 0x6c
    [  134.748659] ath: EEPROM indicates we should expect a direct regpair map
    [  134.748665] ath: Country alpha2 being used: 00
    [  134.748668] ath: Regpair used: 0x6c
    <snip>

I've tried to enable the skip_otp flag while loading ath10k_core, but
that didn't seem to help.  I've also loaded the module with the debug
option, but couldn't deduce where the log lines actually would go.

Also tried to update to the most recent firmware version (4.4.1) to no
avail. One thing I noted there is that it tries to load a file called
firmware-5.bin, which didn't exist:

    ath10k_pci 0004:01:00.0: could not fetch firmware file
'ath10k/QCA6174/hw3.0/firmware-5.bin': -11

For testing, I symlinked the adjacent firmware-6.bin file to
firmware-5.bin which the driver didn't complain about (but was
probably against federal jurisdiction in several countries). The fact
that the driver expected the firmware file to be called firmware-5.bin
could mean that the ath10k driver bundled on my platform is simply too
old and I should look for a backport, perhaps?

Either way, I'd be happy for any pointers as to how to debug this.
Thanks in advance.

Best,
Jens Christian

-- 
Jens Christian Hillerup software engineer
Head of Engine, Veo Technologies

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
