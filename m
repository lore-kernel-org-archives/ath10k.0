Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6CEC7618A
	for <ath10k@archiver.kernel.org>; Mon, 20 Mar 2023 11:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Uu0qx0Tl9HmwHYeJQrogQK5vhnivyx8UDin7eP7AcUA=; b=R+ma1H8FRaiz+/
	pAn4twdz8po2zjdR4zeaXxPUXFaR0ONqiCTh9u7KamhUmCuub7NaqEqkmfg4i3Mxlwug1BaTgSbln
	8DSm5tGPBKVTbhhefXTIXzzgN/3WhNXLJIE1rD0cm771JXvSSarIrn5SWpNcnS3lySOLwiPzATFOY
	u9V4/R2Jyafo36DCyTxKieSHlRPWRfzcqBcHucgWzI/NIP8z0BIpjgji5dSn3qQmYKG8+OWRXp0y/
	w2EX9piuYPBwfr6pSBP9nnB5uyScv9FavWLjRs50h60nUj9LhUMgHEuIJodHnJNHhzUD6Lzv23Cgl
	kozEFlCaNJVwDRQEdqRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peE3h-008tJA-0y;
	Mon, 20 Mar 2023 11:52:13 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peE3e-008tHa-0i
	for ath10k@lists.infradead.org;
	Mon, 20 Mar 2023 11:52:12 +0000
Received: (Authenticated sender: repk@triplefau.lt)
	by mail.gandi.net (Postfix) with ESMTPSA id D521320002
	for <ath10k@lists.infradead.org>; Mon, 20 Mar 2023 11:52:05 +0000 (UTC)
Date: Mon, 20 Mar 2023 12:51:16 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: ath10k@lists.infradead.org
Subject: QCA9888: mesh does not receive broadcast packets
Message-ID: <ZBhItHAcYwNY82zR@pilgrim>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_045210_413685_BDD3BF5F 
X-CRM114-Status: GOOD (  11.62  )
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

Hi,

Using QCA9888 on kernel 5.15 with FW 10.4-3.10-00076, if a mesh
interface is created while a STA is scanning on the same phy, the mesh
interface connects correctly to other mesh nodes but not a single
broadcast packet is received by ath10k (unicast packets are received
correctly). Creating a monitor interface on this phy and bringing it up
allows the mesh interface to receive those broadcast packet.

I tried to add debug in ath10k_htt_rx_h_enqueue() to see ath10k was
seeing those broadcast packets but it doesn't (ath10k_htt_rx_h_enqueue()
sees them only when monitor interface is up).

So I have a hunch it could be that this is a FW issue, I tried with
10.4-3.9.0.2-00157 FW which seem more recent than 10.4-3.10-00076 but
the issue is still here.

Has anyone with a better understanding of the 9888 firmware and/or
ath10k driver any idea how to debug this further ?

I use the script below to reproduce the issue but as it seems to be very
timing sensitive I am not sure other plateform will behave the same.

Thanks

-- 
Remi

---

#!/bin/sh

start_sta() {
        iw phy phy1 interface add  wlan1 type managed
        wpa_supplicant -Dnl80211 -i wlan1 -C /tmp/sta_supp&
        STA_PID=$!

        sleep 4

        wpa_cli -p /tmp/sta_supp/ RAW ADD_NETWORK
        wpa_cli -p /tmp/sta_supp/ RAW SET_NETWORK 0 ssid \"\"
        wpa_cli -p /tmp/sta_supp/ RAW SET_NETWORK 0 key_mgmt NONE
        wpa_cli -p /tmp/sta_supp/ RAW SET_NETWORK 0 scan_ssid 0
        wpa_cli -p /tmp/sta_supp/ RAW ENABLE_NETWORK 0
}

stop_sta() {
        if [ ! "x${STA_PID}" = "x" ]; then
                wpa_cli -p /tmp/wpa_supp RAW REMOVE_NETWORK 0
                kill ${STA_PID}
        fi
        iw dev wlan1 del
}

start_mesh() {
        iw phy phy1 interface add mesh1 type mesh
        ip link set dev mesh1 address 72:FC:8F:A6:00:C4
        wpa_supplicant -Dnl80211 -i mesh1 -C /tmp/mesh_supp&
        MESH_PID=$!

        sleep 4

        wpa_cli -p /tmp/mesh_supp/ RAW ADD_NETWORK
        wpa_cli -p /tmp/mesh_supp/ RAW SET_NETWORK 0 ssid \"mesh\"
        wpa_cli -p /tmp/mesh_supp/ RAW SET_NETWORK 0 key_mgmt NONE
        wpa_cli -p /tmp/mesh_supp/ RAW SET_NETWORK 0 frequency 5240
        wpa_cli -p /tmp/mesh_supp/ RAW SET_NETWORK 0 mode 5
        wpa_cli -p /tmp/mesh_supp/ RAW SET_NETWORK 0 beacon_int 120
        wpa_cli -p /tmp/mesh_supp/ RAW ENABLE_NETWORK 0
}

stop_mesh() {
        if [ ! "x${MESH_PID}" = "x" ]; then
                wpa_cli -p /tmp/mesh_supp RAW REMOVE_NETWORK 0
                kill ${MESH_PID}
        fi
        iw dev mesh1 del
}

main() {
        while [ true ]; do
                stop_sta
                stop_mesh
                start_sta
                start_mesh
                sleep 10
                tcpdump -nepi mesh1 -c 4 -Qin broadcast
        done
}                                                             

main

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
