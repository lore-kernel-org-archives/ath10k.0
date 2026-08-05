Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89B5C55ABF
	for <ath10k@archiver.kernel.org>; Wed,  5 Aug 2026 22:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eZoRDaPm/CzbKCtbuCQjctddB9ds+MKUfZ5Z6mPCGwM=; b=g6o/4978J7p7WpFFBOOewUJLD8
	DsD7anpEjOOKb3NFImLVch9iUD77vDBMpAKT18a9PNVuiiq+irSJ1FOCOeVp1ilqtoMqLeJvU7v67
	dSR4sqG38i7uTVmRtm6G9VI85xWDhkkBvaiWc1XH++nCJj/mwztU6BpsOeU3ZSPxayR7bBkufuVAr
	ylAM2Vs8Qw/WetdO7X4WcYoNDRUlvVyY3gUrQ80MpjykD7WnpdcYh5n+NunLg33BEGtamYxq2uF9W
	kuSbqiZHsUJRNlXhmvPayXtY1h8jPibvXUP7hfv9wZ160C6iRueMZCPJgekrXUN6/aWk7FdmC7hz0
	v+/neSJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrkOU-00000004cc3-48vR;
	Wed, 05 Aug 2026 22:47:26 +0000
Received: from mail-ot1-f79.google.com ([209.85.210.79])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrkOR-00000004cba-3G1w
	for ath10k@lists.infradead.org;
	Wed, 05 Aug 2026 22:47:25 +0000
Received: by mail-ot1-f79.google.com with SMTP id 46e09a7af769-7e9fc6dc091so1233419a34.2
        for <ath10k@lists.infradead.org>; Wed, 05 Aug 2026 15:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785970041; x=1786574841;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZoRDaPm/CzbKCtbuCQjctddB9ds+MKUfZ5Z6mPCGwM=;
        b=USpYghUOKinJJrIAak8lUn/4P/zQjNd0PbTXTk7lhQmd7q/4fHFQFNUonKjHa2kb9t
         9L7CeL7BEuyiXx2ChjEZ4nwH8RsU7sfY/rv2g0jr0/xWjR1WhWT6NmyXAHoLugcUg9pk
         c8tjn7MBz96PmOKWQt2ePdWTigy6fO/ZbsbJdDCIYgtIodi8uI02JZkALkSB3Hzv49FN
         1MFiFx3MUDJlNsKWPj7FXSBvoLi89EzUPFt4InDKWZzXu4fBRjXdHqcl1rgYYua1EgBH
         +0uzZY9OBxiUunpw3l1feFQtzBJM/a4D9AXntL+s19AAXU547pOmS6xbspQecfsa3Oug
         KnVQ==
X-Gm-Message-State: AOJu0YyfQFUtToQz/nsrpLQ79J6Z8r9LuicSsIUXD62+IHy/aAs4A2U8
	IkkMFCA5Te8bvl/PwANvGAmKr1C4srnJU2mM+On8YaAvUoV7nrtmpVMV313Y1RBX58ZvR14PzBZ
	N8Te6rwns9ptkun0qEUm67PbMhgy3tP1MDFlDj1S8495TLVOI9ltdrEsqAjgx4g==
MIME-Version: 1.0
X-Received: by 2002:a4a:ee87:0:b0:6ae:8103:f6ce with SMTP id
 006d021491bc7-6ae96d1aa1fmr5305720eaf.15.1785970041631; Wed, 05 Aug 2026
 15:47:21 -0700 (PDT)
Date: Wed, 05 Aug 2026 15:47:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a73bd79.6851e1c7.236b5a.0003.GAE@google.com>
Subject: [syzbot] [ath10k?] WARNING in ath10k_pci_probe
From: syzbot <syzbot+5c061dd050f2b84b2e1b@syzkaller.appspotmail.com>
To: ath10k@lists.infradead.org, jjohnson@kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_154723_845978_662C4ED3 
X-CRM114-Status: UNSURE (   7.45  )
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

Hello,

syzbot found the following issue on:

HEAD commit:    848acc8ffe1b Merge tag 'fsverity-for-linus' of git://git.k..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=16cd13b9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=5c061dd050f2b84b2e1b
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15b24bb9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1061acc6580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/375d27e96ecb/disk-848acc8f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4ba19a656b9d/vmlinux-848acc8f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7c2a17aaee7c/bzImage-848acc8f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5c061dd050f2b84b2e1b@syzkaller.appspotmail.com

------------[ cut here ]------------
1
WARNING: drivers/net/wireless/ath/ath10k/pci.c:3597 at ath10k_pci_probe+0x6e2/0x1c60 drivers/net/wireless/ath/ath10k/pci.c:3597, CPU#0: kworker/0:2/198
Modules linked in:
CPU: 0 UID: 0 PID: 198 Comm: kworker/0:2 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Workqueue: sync_wq local_pci_probe_callback
RIP: 0010:ath10k_pci_probe+0x6e2/0x1c60 drivers/net/wireless/ath/ath10k/pci.c:3597
Code: 35 fb 45 85 ff 74 50 e8 dc 12 35 fb 48 8b 7c 24 18 48 c7 c6 80 2d 07 8c 31 d2 44 89 f9 e8 26 a7 9c fa eb 7f e8 bf 12 35 fb 90 <0f> 0b 90 41 bf a1 ff ff ff e9 7b 01 00 00 e8 ab 12 35 fb 4c 89 ef
RSP: 0018:ffffc90003aa7980 EFLAGS: 00010293
RAX: ffffffff8690c681 RBX: 00000000ffffffff RCX: ffff88802039dd00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90003aa7ab0 R08: ffff88802039dd00 R09: 0000000000000009
R10: 0000000000000100 R11: 00000000000011ac R12: ffffffff8bcd1d44
R13: ffffc90003aa7a40 R14: 1ffffffff179a3a8 R15: ffff888021ad8000
FS:  0000000000000000(0000) GS:ffff888125c3e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000000000 CR3: 000000003b198000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 local_pci_probe drivers/pci/pci-driver.c:332 [inline]
 local_pci_probe_callback+0x120/0x1e0 drivers/pci/pci-driver.c:361
 process_one_work kernel/workqueue.c:3322 [inline]
 process_scheduled_works+0xa8e/0x14e0 kernel/workqueue.c:3405
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3486
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

