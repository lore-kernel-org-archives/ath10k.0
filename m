Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFvgo-0005ET-Ej
 for ath10k@lists.infradead.org; Mon, 15 Apr 2019 07:06:04 +0000
Date: Mon, 15 Apr 2019 10:05:10 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [ath6kl:ath11k-bringup 58/93]
 drivers/net/wireless/ath/ath11k/debug.c:697 ath11k_write_simulate_fw_crash()
 error: uninitialized symbol 'radioup'.
Message-ID: <20190415070507.GJ31633@kadam>
MIME-Version: 1.0
Content-Disposition: inline
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
To: kbuild@01.org, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, kbuild-all@01.org, ath10k@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath11k-bringup
head:   9bcbbf4cedb7a1f30cb547cf87dc480d7f8a5e87
commit: 5cf3588467b76d48542fd0ff70fc666a723df3bb [58/93] ath11k: make simulate_fw_crash to work if any radio is up

smatch warnings:
drivers/net/wireless/ath/ath11k/debug.c:697 ath11k_write_simulate_fw_crash() error: uninitialized symbol 'radioup'.

# https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=5cf3588467b76d48542fd0ff70fc666a723df3bb
git remote add ath6kl https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
git remote update ath6kl
git checkout 5cf3588467b76d48542fd0ff70fc666a723df3bb
vim +/radioup +697 drivers/net/wireless/ath/ath11k/debug.c

258bbf52 Kalle Valo                2019-02-05  657  
258bbf52 Kalle Valo                2019-02-05  658  /* Simulate firmware crash:
258bbf52 Kalle Valo                2019-02-05  659   * 'soft': Call wmi command causing firmware hang. This firmware hang is
258bbf52 Kalle Valo                2019-02-05  660   * recoverable by warm firmware reset.
258bbf52 Kalle Valo                2019-02-05  661   * 'hard': Force firmware crash by setting any vdev parameter for not allowed
258bbf52 Kalle Valo                2019-02-05  662   * vdev id. This is hard firmware crash because it is recoverable only by cold
258bbf52 Kalle Valo                2019-02-05  663   * firmware reset.
258bbf52 Kalle Valo                2019-02-05  664   */
258bbf52 Kalle Valo                2019-02-05  665  static ssize_t ath11k_write_simulate_fw_crash(struct file *file,
258bbf52 Kalle Valo                2019-02-05  666  					      const char __user *user_buf,
258bbf52 Kalle Valo                2019-02-05  667  					      size_t count, loff_t *ppos)
258bbf52 Kalle Valo                2019-02-05  668  {
d25cb35c Sathishkumar Muruganandam 2019-02-13  669  	struct ath11k_base *ab = file->private_data;
5cf35884 Pradeep Kumar Chitrapu    2019-03-15  670  	struct ath11k_pdev *pdev;
d25cb35c Sathishkumar Muruganandam 2019-02-13  671  	struct ath11k *ar = ab->pdevs[0].ar;
258bbf52 Kalle Valo                2019-02-05  672  	struct crash_inject param;
258bbf52 Kalle Valo                2019-02-05  673  	char buf[32] = {0};
258bbf52 Kalle Valo                2019-02-05  674  	ssize_t rc;
5cf35884 Pradeep Kumar Chitrapu    2019-03-15  675  	int i, ret, radioup;
                                                                    ^^^^^^^
Never set to zero.

258bbf52 Kalle Valo                2019-02-05  676  
5cf35884 Pradeep Kumar Chitrapu    2019-03-15  677  	for (i = 0; i < ab->num_radios; i++) {
5cf35884 Pradeep Kumar Chitrapu    2019-03-15  678  		pdev = &ab->pdevs[i];
5cf35884 Pradeep Kumar Chitrapu    2019-03-15  679  		ar = pdev->ar;
5cf35884 Pradeep Kumar Chitrapu    2019-03-15  680  		if (ar && ar->state == ATH11K_STATE_ON) {
5cf35884 Pradeep Kumar Chitrapu    2019-03-15  681  			radioup = 1;
                                                                        ^^^^^^^^^^^

5cf35884 Pradeep Kumar Chitrapu    2019-03-15  682  			break;
5cf35884 Pradeep Kumar Chitrapu    2019-03-15  683  		}
5cf35884 Pradeep Kumar Chitrapu    2019-03-15  684  	}
258bbf52 Kalle Valo                2019-02-05  685  	/* filter partial writes and invalid commands */
258bbf52 Kalle Valo                2019-02-05  686  	if (*ppos != 0 || count >= sizeof(buf) || count == 0)
258bbf52 Kalle Valo                2019-02-05  687  		return -EINVAL;
258bbf52 Kalle Valo                2019-02-05  688  
258bbf52 Kalle Valo                2019-02-05  689  	rc = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
258bbf52 Kalle Valo                2019-02-05  690  	if (rc < 0)
258bbf52 Kalle Valo                2019-02-05  691  		return rc;
258bbf52 Kalle Valo                2019-02-05  692  
258bbf52 Kalle Valo                2019-02-05  693  	/* drop the possible '\n' from the end */
258bbf52 Kalle Valo                2019-02-05  694  	if (buf[*ppos - 1] == '\n')
258bbf52 Kalle Valo                2019-02-05  695  		buf[*ppos - 1] = '\0';
258bbf52 Kalle Valo                2019-02-05  696  
5cf35884 Pradeep Kumar Chitrapu    2019-03-15 @697  	if (radioup == 0) {
                                                            ^^^^^^^^^^^^

258bbf52 Kalle Valo                2019-02-05  698  		ret = -ENETDOWN;
258bbf52 Kalle Valo                2019-02-05  699  		goto exit;
258bbf52 Kalle Valo                2019-02-05  700  	}
258bbf52 Kalle Valo                2019-02-05  701  
258bbf52 Kalle Valo                2019-02-05  702  	if (!strcmp(buf, "assert")) {
d25cb35c Sathishkumar Muruganandam 2019-02-13  703  		ath11k_info(ab, "simulating firmware assert crash\n");
258bbf52 Kalle Valo                2019-02-05  704  		param.type = ATH11K_WMI_FW_HANG_ASSERT_TYPE;
258bbf52 Kalle Valo                2019-02-05  705  		param.delay_time_ms = ATH11K_WMI_FW_HANG_DELAY;
d25cb35c Sathishkumar Muruganandam 2019-02-13  706  		ret = ath11k_send_crash_inject_cmd(&ab->wmi_sc.wmi[0], &param);
258bbf52 Kalle Valo                2019-02-05  707  	} else {
258bbf52 Kalle Valo                2019-02-05  708  		ret = -EINVAL;
258bbf52 Kalle Valo                2019-02-05  709  		goto exit;
258bbf52 Kalle Valo                2019-02-05  710  	}
258bbf52 Kalle Valo                2019-02-05  711  
258bbf52 Kalle Valo                2019-02-05  712  	if (ret) {
d25cb35c Sathishkumar Muruganandam 2019-02-13  713  		ath11k_warn(ab, "failed to simulate firmware crash: %d\n", ret);
258bbf52 Kalle Valo                2019-02-05  714  		goto exit;
258bbf52 Kalle Valo                2019-02-05  715  	}
258bbf52 Kalle Valo                2019-02-05  716  
258bbf52 Kalle Valo                2019-02-05  717  	ret = count;
258bbf52 Kalle Valo                2019-02-05  718  
258bbf52 Kalle Valo                2019-02-05  719  exit:
258bbf52 Kalle Valo                2019-02-05  720  	return ret;
258bbf52 Kalle Valo                2019-02-05  721  }
258bbf52 Kalle Valo                2019-02-05  722  

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
