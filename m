Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQtdP-0003DJ-Da
 for ath10k@lists.infradead.org; Tue, 10 Jan 2017 10:26:34 +0000
Date: Tue, 10 Jan 2017 15:55:54 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: QCA9984 firmware crash
Message-ID: <20170110102554.GA7294@atheros-ThinkPad-T61>
References: <CABuVarLXcrn1Lz3GHV1QBQxdoUg9YwJF7B43B_YqFg6Y7swPJQ@mail.gmail.com>
 <CAJ-Vmok5PPcDzzprXe+JWRsw3-A0jBrxS4ORhBR5tGoJ0G_G=g@mail.gmail.com>
 <CABuVarK4gF2pBCEBUEE_5RfmrcHUcYpeHMFUw3-F3KHrHHhkkw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABuVarK4gF2pBCEBUEE_5RfmrcHUcYpeHMFUw3-F3KHrHHhkkw@mail.gmail.com>
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
To: Sergey Stepanov <no.such.process@gmail.com>
Cc: Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hello,

Any luck trying the updated one ?
https://source.codeaurora.org/quic/qsdk/oss/firmware/ath10k-firmware/plain/ath10k/QCA9984/hw1.0/firmware-5.bin_10.4-3.3-00102

Btw, are you using backports (or) ath.git ? Have you made any private changes ?

regards,
shafi

On Tue, Jan 10, 2017 at 10:58:48AM +0500, Sergey Stepanov wrote:
> Hi,
> 
> Thanks for reply.
> Actually the firmware crashes twice: during probing and during driver
> registering,
> Here are these logs:
> 
> ath10k_debug_print_hwfw_info()    : qca9984/qca9994 hw1.0 target
> 0x01000000 chip_id 0x00000000 sub 168c:cafe
> ath10k_debug_print_hwfw_info()    : firmware ver 10.4-3.3-00092 api 5
> features no-p2p,mfp,peer-flow-ctrl,btcoex-param
> ath10k_core_pre_cal_download()    : boot did not find a pre
> calibration file, try DT next: -2
> ath10k_core_pre_cal_download()    : boot using calibration mode pre-cal-dt
> ath10k_core_get_board_id_from_ot(): boot upload otp to 0x1234 len 9000
> for board id
> ath10k_bmi_fast_download()        : bmi fast download address 0x1234
> buffer 0x0x10595254 length 9000
> ath10k_bmi_lz_stream_start()      : bmi lz stream start address 0x1234
> ath10k_bmi_lz_data()              : bmi lz data buffer 0x0x10595254 length 9000
> ath10k_bmi_lz_stream_start()      : bmi lz stream start address 0x0
> ath10k_bmi_execute()              : bmi execute address 0x1234 param 0x10
> ath10k_bmi_execute()              : bmi execute result 0x400
> ath10k_core_get_board_id_from_ot(): boot get otp board id result
> 0x00000400 board_id 1 chip_id 0
> ath10k_core_create_board_name()   : boot using board name
> 'bus=pci,bmi-chip-id=0,bmi-board-id=1'
> ath10k_core_parse_bd_ie_board()   : board name: len=36
> ath10k_core_parse_bd_ie_board()   : 62 75 73 3D 70 63 69 2C 62 6D 69
> 2D 63 68 69 70
> ath10k_core_parse_bd_ie_board()   : 2D 69 64 3D 30 2C 62 6D 69 2D 62
> 6F 61 72 64 2D
> ath10k_core_parse_bd_ie_board()   : 69 64 3D 31
> ath10k_core_parse_bd_ie_board()   : boot found match for name
> 'bus=pci,bmi-chip-id=0,bmi-board-id=1'
> ath10k_core_parse_bd_ie_board()   : boot found board data for
> 'bus=pci,bmi-chip-id=0,bmi-board-id=1'
> ath10k_core_fetch_board_file()    : using board api 2
> ath10k_bmi_start()                : bmi start
> ath10k_bmi_write_memory()         : bmi write address 0x400800 length 4
> ath10k_bmi_read_memory()          : bmi read address 0x400810 length 4
> ath10k_bmi_write_memory()         : bmi write address 0x400810 length 4
> ath10k_bmi_write_memory()         : bmi write address 0x400844 length 4
> ath10k_bmi_write_memory()         : bmi write address 0x400904 length 4
> ath10k_bmi_write_memory()         : bmi write address 0x4008bc length 4
> ath10k_core_pre_cal_download()    : boot did not find a pre
> calibration file, try DT next: -2
> ath10k_core_pre_cal_download()    : boot using calibration mode pre-cal-dt
> ath10k_core_get_board_id_from_ot(): boot upload otp to 0x1234 len 9000
> for board id
> ath10k_bmi_fast_download()        : bmi fast download address 0x1234
> buffer 0x0x10595254 length 9000
> ath10k_bmi_lz_stream_start()      : bmi lz stream start address 0x1234
> ath10k_bmi_lz_data()              : bmi lz data buffer 0x0x10595254 length 9000
> ath10k_bmi_lz_stream_start()      : bmi lz stream start address 0x0
> ath10k_bmi_execute()              : bmi execute address 0x1234 param 0x10
> ath10k_bmi_execute()              : bmi execute result 0x400
> ath10k_core_get_board_id_from_ot(): boot get otp board id result
> 0x00000400 board_id 1 chip_id 0
> ath10k_bmi_read_memory()          : bmi read address 0x4008ac length 4
> ath10k_push_board_ext_data()      : boot push board extended data addr 0x0
> ath10k_bmi_read_memory()          : bmi read address 0x400854 length 4
> ath10k_bmi_write_memory()         : bmi write address 0xc0000 length 12064
> ath10k_bmi_write_memory()         : bmi write address 0x400858 length 4
> ath10k_download_and_run_otp()     : boot upload otp to 0x1234 len 9000
> ath10k_bmi_fast_download()        : bmi fast download address 0x1234
> buffer 0x0x10595254 length 9000
> ath10k_bmi_lz_stream_start()      : bmi lz stream start address 0x1234
> ath10k_bmi_lz_data()              : bmi lz data buffer 0x0x10595254 length 9000
> ath10k_bmi_lz_stream_start()      : bmi lz stream start address 0x0
> ath10k_bmi_execute()              : bmi execute address 0x1234 param 0x700
> ath10k_bmi_execute()              : bmi execute result 0x0
> ath10k_download_and_run_otp()     : boot otp execute result 0
> ath10k_core_pre_cal_config()      : pre cal configuration done successfully
> ath10k_swap_code_seg_configure()  : boot found firmware code swap binary
> ath10k_bmi_write_memory()         : bmi write address 0x422108 length 208
> ath10k_download_fw()              : boot uploading firmware image
> 0x10597584K len 374947
> ath10k_bmi_fast_download()        : bmi fast download address 0x1234
> buffer 0x0x10597584 length 374947
> ath10k_bmi_lz_stream_start()      : bmi lz stream start address 0x1234
> ath10k_bmi_lz_data()              : bmi lz data buffer 0x0x10597584
> length 374944
> ath10k_bmi_lz_data()              : bmi lz data buffer 0x0x153b91a8 length 4
> ath10k_bmi_lz_stream_start()      : bmi lz stream start address 0x0
> ath10k_bmi_write_memory()         : bmi write address 0x400814 length 4
> ath10k_pci_hif_get_default_pipe() : pci hif get default pipe
> ath10k_pci_hif_map_service_to_pi(): pci hif map service
> ath10k_bmi_done()                 : bmi done
> ath10k_htt_tx_alloc()             : htt tx max num pending tx 2500
> ath10k_htt_rx_alloc()             : htt rx ring size 2048 fill_level 1023
> ath10k_pci_hif_start()            : boot hif start
> napi_schedule()                   : napi schedule
> napi_task()                       : napi poll
> napi_complete()                   : napi complete
> napi_schedule()                   : napi schedule
> napi_task()                       : napi poll
> ath10k_pci_process_rx_cb()        : pci rx ce pipe 1 len 20
> ath10k_pci_process_rx_cb()        : pci rx: len=20
> ath10k_pci_process_rx_cb()        : 00 00 0C 00 00 00 00 00 01 00 02
> 00 00 07 16 00
> ath10k_pci_process_rx_cb()        : 01 00 00 00
> napi_complete()                   : napi complete
> ath10k_htc_wait_target()          : Target ready! transmit resources:
> 2 size:1792
> ath10k_pci_hif_map_service_to_pi(): pci hif map service
> ath10k_htc_connect_service()      : boot htc service 'Control' ul pipe
> 0 dl pipe 1 eid 0 ready
> ath10k_htc_connect_service()      : boot htc service 'Control' eid 0
> TX flow control disabled
> ath10k_htc_connect_service()      : boot htc service HTT Data does not
> allocate target credits
> ath10k_htc_build_tx_ctrl_skb()    : ath10k_htc_build_tx_ctrl_skb: skb
> 0x15233f00K
> ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x07703830 len
> 16 n_items 1
> ath10k_pci_hif_tx_sg()            : pci tx data: len=16
> ath10k_pci_hif_tx_sg()            : 00 01 08 00 00 00 00 00 02 00 00
> 03 08 00 00 00
> napi_schedule()                   : napi schedule
> napi_task()                       : napi poll
> ath10k_htc_notify_tx_completion() : ath10k_htc_notify_tx_completion:
> ep 0 skb 0x15233f00K
> ath10k_pci_process_rx_cb()        : pci rx ce pipe 1 len 20
> ath10k_pci_process_rx_cb()        : pci rx: len=20
> ath10k_pci_process_rx_cb()        : 00 00 0C 00 00 01 00 00 03 00 00
> 03 00 01 D0 07
> ath10k_pci_process_rx_cb()        : 00 00 00 00
> napi_complete()                   : napi complete
> ath10k_htc_connect_service()      : HTC Service HTT Data connect
> response: status: 0x0, assigned ep: 0x1
> ath10k_pci_hif_map_service_to_pi(): pci hif map service
> ath10k_htc_connect_service()      : boot htc service 'HTT Data' ul
> pipe 4 dl pipe 5 eid 1 ready
> ath10k_htc_connect_service()      : boot htc service 'HTT Data' eid 1
> TX flow control disabled
> ath10k_htc_build_tx_ctrl_skb()    : ath10k_htc_build_tx_ctrl_skb: skb
> 0x15233ea8K
> ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x07703830 len
> 16 n_items 1
> ath10k_pci_hif_tx_sg()            : pci tx data: len=16
> ath10k_pci_hif_tx_sg()            : 00 01 08 00 00 01 00 00 02 00 00
> 01 00 02 00 00
> napi_schedule()                   : napi schedule
> napi_task()                       : napi poll
> ath10k_htc_notify_tx_completion() : ath10k_htc_notify_tx_completion:
> ep 0 skb 0x15233ea8K
> ath10k_pci_process_rx_cb()        : pci rx ce pipe 1 len 20
> ath10k_pci_process_rx_cb()        : pci rx: len=20
> ath10k_pci_process_rx_cb()        : 00 00 0C 00 00 02 00 00 03 00 00
> 01 00 02 B4 06
> ath10k_pci_process_rx_cb()        : 00 00 00 00
> napi_complete()                   : napi complete
> ath10k_htc_connect_service()      : HTC Service WMI connect response:
> status: 0x0, assigned ep: 0x2
> ath10k_pci_hif_map_service_to_pi(): pci hif map service
> ath10k_htc_connect_service()      : boot htc service 'WMI' ul pipe 3
> dl pipe 2 eid 2 ready
> ath10k_htc_build_tx_ctrl_skb()    : ath10k_htc_build_tx_ctrl_skb: skb
> 0x15233e50K
> ath10k_htc_start()                : HTC is using TX credit flow control
> ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x07703830 len
> 20 n_items 1
> ath10k_pci_hif_tx_sg()            : pci tx data: len=20
> ath10k_pci_hif_tx_sg()            : 00 01 0C 00 00 02 00 00 05 00 00
> 00 00 00 00 00
> ath10k_pci_hif_tx_sg()            : 00 00 00 00
> napi_schedule()                   : napi schedule
> napi_task()                       : napi poll
> ath10k_htc_notify_tx_completion() : ath10k_htc_notify_tx_completion:
> ep 0 skb 0x15233e50K
> napi_complete()                   : napi complete
> napi_schedule()                   : napi schedule
> napi_task()                       : napi poll
> ath10k_pci_process_rx_cb()        : pci rx ce pipe 2 len 284
> ath10k_pci_process_rx_cb()        : pci rx: len=284
> ath10k_pci_process_rx_cb()        : 02 00 14 01 00 03 00 00 00 80 00
> 00 00 00 00 01
> ath10k_pci_process_rx_cb()        : 5C 00 00 00 03 00 00 00 01 00 00
> 00 05 00 00 00
> ath10k_pci_process_rx_cb()        : 08 00 00 00 07 00 00 00 07 00 00
> 00 09 00 00 00
> ath10k_pci_process_rx_cb()        : 04 00 00 00 01 00 00 00 0E 00 00
> 00 08 00 00 00
> ath10k_htc_rx_completion_handler(): htc rx completion ep 2 skb 0x1525a958K
> napi_complete()                   : napi complete
> ath10k_wmi_event_service_ready_w(): wmi svc: len=64
> ath10k_wmi_event_service_ready_w(): 08 00 00 00 07 00 00 00 07 00 00
> 00 09 00 00 00
> ath10k_wmi_event_service_ready_w(): 04 00 00 00 01 00 00 00 0E 00 00
> 00 08 00 00 00
> ath10k_wmi_event_service_ready_w(): 0D 00 00 00 03 00 00 00 0E 00 00
> 00 0C 00 00 00
> ath10k_wmi_event_service_ready_w(): 0F 00 00 00 02 00 00 00 00 00 00
> 00 00 00 00 00
> ath10k_wmi_event_service_ready_w(): wmi mem_req_id 1 num_units 0
> num_unit_info 2 unit size 2216 actual units 529
> ath10k_wmi_event_service_ready_w(): wmi mem_req_id 2 num_units 1
> num_unit_info 12 unit size 256 actual units 52
> ath10k_wmi_event_service_ready_w(): wmi mem_req_id 3 num_units 1
> num_unit_info 12 unit size 1024 actual units 52
> ath10k_wmi_event_service_ready_w(): wmi mem_req_id 4 num_units 1
> num_unit_info 12 unit size 4096 actual units 52
> ath10k_wmi_event_service_ready_w(): wmi mem_req_id 6 num_units 35
> num_unit_info 0 unit size 3072 actual units 35
> ath10k_wmi_event_service_ready_w(): wmi mem_req_id 7 num_units 1
> num_unit_info 0 unit size 12288 actual units 1
> ath10k_wmi_event_service_ready_w(): wmi mem_req_id 5 num_units 0
> num_unit_info 2 unit size 1980 actual units 529
> ath10k_wmi_event_service_ready_w(): wmi event service ready
> min_tx_power 0x0000003f max_tx_power 0x0000003f ht_cap 0x0000185b
> vht_cap 0x339b79f2 sw_ver0 0x01000000 sw_ver1 0x0000005c 0
> ath10k_core_start()               : firmware 10.4-3.3-00092 booted
> ath10k_wmi_10_4_ext_resource_con(): wmi ext resource config host type
> 1 firmware feature bitmap 00000010
> ath10k_htc_send()                 : htc ep 2 consumed 1 credits (total 1)
> ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x05745764 len
> 20 n_items 1
> ath10k_pci_hif_tx_sg()            : pci tx data: len=20
> ath10k_pci_hif_tx_sg()            : 02 01 0C 00 00 00 00 00 8D 90 00
> 00 01 00 00 00
> ath10k_pci_hif_tx_sg()            : 10 00 00 00
> napi_schedule()                   : napi schedule
> ath10k_wmi_put_host_mem_chunks()  : wmi chunk 0 len 1172264 requested,
> addr 0x5103ce0
> ath10k_wmi_put_host_mem_chunks()  : wmi chunk 1 len 13312 requested,
> addr 0x5100840
> ath10k_wmi_put_host_mem_chunks()  : wmi chunk 2 len 53248 requested,
> addr 0x50f37a0
> ath10k_wmi_put_host_mem_chunks()  : wmi chunk 3 len 212992 requested,
> addr 0x50bf6e0
> ath10k_wmi_put_host_mem_chunks()  : wmi chunk 4 len 107520 requested,
> addr 0x50a5240
> ath10k_wmi_put_host_mem_chunks()  : wmi chunk 5 len 12288 requested,
> addr 0x50a21a0
> ath10k_wmi_put_host_mem_chunks()  : wmi chunk 6 len 1047420 requested,
> addr 0x4fa2580
> ath10k_wmi_10_4_op_gen_init()     : wmi init 10.4
> ath10k_htc_send()                 : htc ep 2 consumed 1 credits (total 0)
> ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x07dff824 len
> 280 n_items 1
> ath10k_pci_hif_tx_sg()            : pci tx data: len=280
> ath10k_pci_hif_tx_sg()            : 02 01 10 01 00 01 00 00 00 A0 00
> 00 10 00 00 00
> ath10k_pci_hif_tx_sg()            : 10 02 00 00 33 00 00 00 00 00 00
> 00 00 00 00 00
> ath10k_pci_hif_tx_sg()            : 02 00 00 00 66 00 00 00 20 00 00
> 00 0F 00 00 00
> ath10k_pci_hif_tx_sg()            : 0F 00 00 00 64 00 00 00 64 00 00
> 00 64 00 00 00
> napi_task()                       : napi poll
> ath10k_pci_process_rx_cb()        : pci rx ce pipe 1 len 16
> ath10k_pci_process_rx_cb()        : pci rx: len=16
> ath10k_pci_process_rx_cb()        : 00 02 08 00 08 04 00 00 01 04 00
> 01 02 01 B4 06
> ath10k_htc_process_credit_report(): htc ep 2 got 1 credits (total 1)
> ath10k_htc_notify_tx_completion() : ath10k_htc_notify_tx_completion:
> ep 2 skb 0x15233df8K
> ath10k_htc_notify_tx_completion() : ath10k_htc_notify_tx_completion:
> ep 2 skb 0x15233da0K
> napi_complete()                   : napi complete
> napi_schedule()                   : napi schedule
> napi_task()                       : napi poll
> ath10k_pci_process_rx_cb()        : pci rx ce pipe 5 len 28
> ath10k_pci_process_rx_cb()        : pci rx: len=28
> ath10k_pci_process_rx_cb()        : 01 00 14 00 00 05 00 00 0F 00 00
> 00 64 14 00 00
> ath10k_pci_process_rx_cb()        : 5A 14 00 00 02 00 00 00 09 00 00 00
> napi_complete()                   : napi complete
> napi_schedule()                   : napi schedule
> napi_task()                       : napi poll
> ath10k_pci_process_rx_cb()        : pci rx ce pipe 2 len 40
> ath10k_pci_process_rx_cb()        : pci rx: len=40
> ath10k_pci_process_rx_cb()        : 02 00 20 00 00 06 00 00 01 80 00
> 00 00 00 00 01
> ath10k_pci_process_rx_cb()        : 03 00 00 00 04 F0 21 26 82 67 00
> 00 00 00 00 00
> ath10k_pci_process_rx_cb()        : 00 00 00 00 00 00 00 00
> ath10k_htc_rx_completion_handler(): htc rx completion ep 2 skb 0x1525a900K
> ath10k_wmi_event_ready()          : wmi event ready sw_version
> 16777216 abi_version 3 mac_addr 04F021268267 status 0
> napi_complete()                   : napi complete
> napi_schedule()                   : napi schedule
> napi_task()                       : napi poll
> ath10k_pci_process_rx_cb()        : pci rx ce pipe 1 len 16
> ath10k_pci_process_rx_cb()        : pci rx: len=16
> ath10k_pci_process_rx_cb()        : 00 02 08 00 08 07 00 00 01 04 00
> 01 02 01 B4 06
> ath10k_htc_process_credit_report(): htc ep 2 got 1 credits (total 2)
> napi_complete()                   : napi complete
> ath10k_wmi_op_gen_vdev_create()   : WMI vdev create: id 0 type 2
> subtype 0 macaddr 04F021268267
> ath10k_htc_send()                 : htc ep 2 consumed 1 credits (total 1)
> ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x056d5a64 len
> 32 n_items 1
> ath10k_pci_hif_tx_sg()            : pci tx data: len=32
> ath10k_pci_hif_tx_sg()            : 02 01 18 00 00 02 00 00 13 90 00
> 00 00 00 00 00
> ath10k_pci_hif_tx_sg()            : 02 00 00 00 00 00 00 00 04 F0 21
> 26 82 67 00 00
> napi_schedule()                   : napi schedule
> napi_schedule()              ()   : WMI vdev delete id 0
> ath10k_htc_send()                 : htc ep 2 consumed 1 credits (total 0)
> ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x05745764 len
> 16 n_items 1
> ath10k_pci_hif_tx_sg()            : pci tx data: len=16
> ath10k_pci_hif_tx_sg()            : 02 01 08 00 00 03 00 00 14 90 00
> 00 00 00 00 00
> ath10k_wmi_op_gen_echo()          : wmi echo value 0x0ba991e9
> napi_task()                       : napi poll
> ath10k_htc_notify_tx_completion() : ath10k_htc_notify_tx_completion:
> ep 2 skb 0x15233c98K
> ath10k_htc_notify_tx_completion() : ath10k_htc_notify_tx_completion:
> ep 2 skb 0x15233c40K
> napi_complete()                   : napi complete
> napi_schedule()                   : napi schedule
> napi_task()                       : napi poll
> ath10k_pci_process_rx_cb()        : pci rx ce pipe 1 len 16
> ath10k_pci_process_rx_cb()        : pci rx: len=16
> ath10k_pci_process_rx_cb()        : 00 02 08 00 08 08 00 00 01 04 00
> 01 02 01 B4 06
> ath10k_htc_process_credit_report(): htc ep 2 got 1 credits (total 1)
> napi_complete()                   : napi complete
> napi_schedule()                   : napi schedule
> napi_task()                       : napi poll
> ath10k_pci_process_rx_cb()        : pci rx ce pipe 1 len 16
> ath10k_pci_process_rx_cb()        : pci rx: len=16
> ath10k_pci_process_rx_cb()        : 00 02 08 00 08 09 00 00 01 04 00
> 00 02 01 00 00
> ath10k_htc_process_credit_report(): htc ep 2 got 1 credits (total 2)
> napi_complete()                   : napi complete
> ath10k_htc_send()                 : htc ep 2 consumed 1 credits (total 1)
> ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x056d5964 len
> 16 n_items 1
> ath10k_pci_hif_tx_sg()            : pci tx data: len=16
> ath10k_pci_hif_tx_sg()            : 02 01 08 00 00 04 00 00 05 90 00
> 00 E9 91 A9 0B
> napi_schedule()                   : napi schedule
> napi_task()                       : napi poll
> ath10k_pci_process_rx_cb()        : pci rx ce pipe 1 len 16
> ath10k_pci_process_rx_cb()        : pci rx: len=16
> ath10k_pci_process_rx_cb()        : 00 02 08 00 08 0B 00 00 01 04 00
> 00 02 01 00 00
> ath10k_htc_process_credit_report(): htc ep 2 got 1 credits (total 2)
> ath10k_pci_process_rx_cb()        : pci rx ce pipe 2 len 16
> ath10k_pci_process_rx_cb()        : pci rx: len=16
> ath10k_pci_process_rx_cb()        : 02 00 08 00 00 0A 00 00 01 90 00
> 00 E9 91 A9 0B
> ath10k_htc_rx_completion_handler(): htc rx completion ep 2 skb 0x1525a8a8K
> ath10k_wmi_event_echo()           : wmi event echo value 0x0ba991e9
> ath10k_htc_notify_tx_completion() : ath10k_htc_notify_tx_completion:
> ep 2 skb 0x15233be8K
> napi_complete()                   : napi complete
> ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x056d5964 len
> 12 n_items 1
> ath10k_pci_hif_tx_sg()            : pci tx data: len=12
> ath10k_pci_hif_tx_sg()            : 01 01 04 00 00 00 00 00 00 90 00 00
> napi_schedule()                   : napi schedule
> napi_task()                       : napi poll
> ath10k_pci_process_rx_cb()        : pci rx ce pipe 5 len 12
> ath10k_pci_process_rx_cb()        : pci rx: len=12
> ath10k_pci_process_rx_cb()        : 01 00 04 00 00 0C 00 00 00 02 02 00
> napi_complete()                   : napi complete
> ath10k_htt_verify_version()       : htt target version 2.2
> ath10k_htt_send_frag_desc_bank_c(): htt frag desc bank cmd
> ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x056d5964 len
> 56 n_items 1
> ath10k_pci_hif_tx_sg()            : pci tx data: len=56
> ath10k_pci_hif_tx_sg()            : 01 01 30 00 00 01 00 00 06 08 01
> 40 40 DB 26 05
> ath10k_pci_hif_tx_sg()            : 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 C3 09
> ath10k_pci_hif_tx_sg()            : 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00
> ath10k_pci_hif_tx_sg()            : 00 00 00 00 00 00 00 00
> ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x05745764 len
> 48 n_items 1
> ath10k_pci_hif_tx_sg()            : pci tx data: len=48
> ath10k_pci_hif_tx_sg()            : 01 01 28 00 00 02 00 00 02 01 00
> 00 A0 5A 26 05
> ath10k_pci_hif_tx_sg()            : E0 5A 26 05 00 08 80 07 FF FF FF
> 03 3B 00 4B 00
> ath10k_pci_hif_tx_sg()            : 15 00 1F 00 03 00 14 00 06 00 0A
> 00 01 00 02 00
> ath10k_htt_h2t_aggr_cfg_msg()     : htt h2t aggr cfg msg amsdu 2 ampdu 62
> ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x056d5a64 len
> 11 n_items 1
> ath10k_pci_hif_tx_sg()            : pci tx data: len=11
> ath10k_pci_hif_tx_sg()            : 01 01 03 00 00 03 00 00 05 3E 02
> ath10k_htc_send()                 : htc ep 2 consumed 1 credits (total 1)
> ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x056d5864 len
> 16 n_items 1
> ath10k_pci_hif_tx_sg()            : pci tx data: len=16
> ath10k_pci_hif_tx_sg()            : 02 01 08 00 00 05 00 00 55 90 00
> 00 01 00 00 00
> napi_schedule()                   : napi schedule
> napi_task()                       : napi poll
> ath10k_htc_notify_tx_completion() : ath10k_htc_notify_tx_completion:
> ep 2 skb 0x152339d8K
> napi_complete()                   : napi complete
> napi_schedule()                   : napi schedule
> napi_task()                       : napi poll
> ath10k_pci_fw_crashed_dump()      : firmware crashed! (uuid n/a)
> ath10k_pci_dump_registers()       : firmware register dump:
> ath10k_pci_dump_registers()       : [00]: 0x0000000A 0x000015B3
> 0x0A0347D6 0x00975B31
> ath10k_pci_dump_registers()       : [04]: 0x0A0347D6 0x00060930
> 0x0000000E 0x00000000
> ath10k_pci_dump_registers()       : [08]: 0x0042EAE8 0x004068D4
> 0x00000000 0x00471A40
> ath10k_pci_dump_registers()       : [12]: 0x00000009 0x00000000
> 0x00973D28 0x00973D33
> ath10k_pci_dump_registers()       : [16]: 0x0A0347D6 0x009606B8
> 0x00000000 0x00000000
> ath10k_pci_dump_registers()       : [20]: 0x409C7CEE 0x0040677C
> 0x00400000 0x00000000
> ath10k_pci_dump_registers()       : [24]: 0x809C440F 0x004067DC
> 0x004159F4 0xC09C7CEE
> ath10k_pci_dump_registers()       : [28]: 0x809B358C 0x0040680C
> 0x0042EAE8 0x004068D4
> ath10k_pci_dump_registers()       : [32]: 0x809B31B0 0x0040683C
> 0x0042713C 0x0041778C
> ath10k_pci_dump_registers()       : [36]: 0x809B320A 0x0040690C
> 0x0040697C 0x00975A00
> ath10k_pci_dump_registers()       : [40]: 0x809B2DA8 0x0040693C
> 0x00000001 0x0040697C
> ath10k_pci_dump_registers()       : [44]: 0x809B2484 0x0040695C
> 0x0042325C 0x00423280
> ath10k_pci_dump_registers()       : [48]: 0x8096EE0E 0x0040697C
> 0x00427134 0x00000001
> ath10k_pci_dump_registers()       : [52]: 0x8096F883 0x00406A2C
> 0x0042C914 0x00423938
> ath10k_pci_dump_registers()       : [56]: 0x80963A26 0x00406A4C
> 0x0042C914 0x00405528
> 
> 
> ath10k_core_start()               : firmware 10.4-3.3-00092 booted
> ath10k_wmi_10_4_ext_resource_con(): wmi ext resource config host type
> 1 firmware feature bitmap 00000010
> ath10k_htc_send()                 : htc ep 2 consumed 1 credits (total 1)
> ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x056f5b64 len
> 20 n_items 1
> ath10k_pci_hif_tx_sg()            : pci tx data: len=20
> ath10k_pci_hif_tx_sg()            : 02 01 0C 00 00 06 00 00 8D 90 00
> 00 01 00 00 00
> ath10k_pci_hif_tx_sg()            : 10 00 00 00
> napi_schedule()                   : napi schedule
> ath10k_wmi_put_host_mem_chunks()  : wmi chunk 0 len 1172264 requested,
> addr 0x5103ce0
> ath10k_wmi_put_host_mem_chunks()  : wmi chunk 1 len 13312 requested,
> addr 0x5100840
> ath10k_wmi_put_host_mem_chunks()  : wmi chunk 2 len 53248 requested,
> addr 0x50f37a0
> ath10k_wmi_put_host_mem_chunks()  : wmi chunk 3 len 212992 requested,
> addr 0x50bf6e0
> ath10k_wmi_put_host_mem_chunks()  : wmi chunk 4 len 107520 requested,
> addr 0x50a5240
> ath10k_wmi_put_host_mem_chunks()  : wmi chunk 5 len 12288 requested,
> addr 0x50a21a0
> ath10k_wmi_put_host_mem_chunks()  : wmi chunk 6 len 1047420 requested,
> addr 0x4fa2580
> ath10k_wmi_10_4_op_gen_init()     : wmi init 10.4
> ath10k_htc_send()                 : htc ep 2 consumed 1 credits (total 0)
> ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x07903824 len
> 280 n_items 1
> ath10k_pci_hif_tx_sg()            : pci tx data: len=280
> ath10k_pci_hif_tx_sg()            : 02 01 10 01 00 07 00 00 00 A0 00
> 00 10 00 00 00
> ath10k_pci_hif_tx_sg()            : 10 02 00 00 33 00 00 00 00 00 00
> 00 00 00 00 00
> ath10k_pci_hif_tx_sg()            : 02 00 00 00 66 00 00 00 20 00 00
> 00 0F 00 00 00
> ath10k_pci_hif_tx_sg()            : 0F 00 00 00 64 00 00 00 64 00 00
> 00 64 00 00 00
> napi_task()                       : napi poll
> ath10k_pci_process_rx_cb()        : pci rx ce pipe 1 len 16
> ath10k_pci_process_rx_cb()        : pci rx: len=16
> ath10k_pci_process_rx_cb()        : 00 02 08 00 08 04 00 00 01 04 00
> 01 02 01 B4 06
> ath10k_htc_process_credit_report(): htc ep 2 got 1 credits (total 1)
> ath10k_htc_notify_tx_completion() : ath10k_htc_notify_tx_completion:
> ep 2 skb 0x14f91dc8K
> ath10k_htc_notify_tx_completion() : ath10k_htc_notify_tx_completion:
> ep 2 skb 0x14f91d70K
> napi_complete()                   : napi complete
> napi_schedule()                   : napi schedule
> napi_task()                       : napi poll
> ath10k_pci_process_rx_cb()        : pci rx ce pipe 5 len 28
> ath10k_pci_process_rx_cb()        : pci rx: len=28
> ath10k_pci_process_rx_cb()        : 01 00 14 00 00 05 00 00 0F 00 00
> 00 64 14 00 00
> ath10k_pci_process_rx_cb()        : 5A 14 00 00 02 00 00 00 09 00 00 00
> napi_complete()                   : napi complete
> napi_schedule()                   : napi schedule
> napi_task()                       : napi poll
> ath10k_pci_process_rx_cb()        : pci rx ce pipe 2 len 40
> ath10k_pci_process_rx_cb()        : pci rx: len=40
> ath10k_pci_process_rx_cb()        : 02 00 20 00 00 06 00 00 01 80 00
> 00 00 00 00 01
> ath10k_pci_process_rx_cb()        : 03 00 00 00 04 F0 21 26 82 67 00
> 00 00 00 00 00
> ath10k_pci_process_rx_cb()        : 00 00 00 00 00 00 00 00
> ath10k_htc_rx_completion_handler(): htc rx completion ep 2 skb 0x1522e548K
> ath10k_wmi_event_ready()          : wmi event ready sw_version
> 16777216 abi_version 3 mac_addr 04F021268267 status 0
> napi_complete()                   : napi complete
> napi_schedule()                   : napi schedule
> napi_task()                       : napi poll
> ath10k_pci_process_rx_cb()        : pci rx ce pipe 1 len 16
> ath10k_pci_process_rx_cb()        : pci rx: len=16
> ath10k_pci_process_rx_cb()        : 00 02 08 00 08 07 00 00 01 04 00
> 01 02 01 B4 06
> ath10k_htc_process_credit_report(): htc ep 2 got 1 credits (total 2)
> napi_complete()                   : napi complete
> ath10k_wmi_op_gen_vdev_create()   : WMI vdev create: id 0 type 2
> subtype 0 macaddr 04F021268267
> ath10k_htc_send()                 : htc ep 2 consumed 1 credits (total 1)
> ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x05745c64 len
> 32 n_items 1
> ath10k_pci_hif_tx_sg()            : pci tx data: len=32
> ath10k_pci_hif_tx_sg()            : 02 01 18 00 00 08 00 00 13 90 00
> 00 00 00 00 00
> ath10k_pci_hif_tx_sg()            : 02 00 00 00 00 00 00 00 04 F0 21
> 26 82 67 00 00
> napi_schedule()                   : napi schedule
> napi_schedule()                   : WMI vdev delete id 0
> ath10k_htc_send()                 : htc ep 2 consumed 1 credits (total 0)
> ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x056f5b64 len
> 16 n_items 1
> ath10k_pci_hif_tx_sg()            : pci tx data: len=16
> ath10k_pci_hif_tx_sg()            : 02 01 08 00 00 09 00 00 14 90 00
> 00 00 00 00 00
> ath10k_wmi_op_gen_echo()          : wmi echo value 0x0ba991e9
> napi_task()                       : napi poll
> ath10k_htc_notify_tx_completion() : ath10k_htc_notify_tx_completion:
> ep 2 skb 0x14f91c68K
> ath10k_htc_notify_tx_completion() : ath10k_htc_notify_tx_completion:
> ep 2 skb 0x14f91c10K
> napi_complete()                   : napi complete
> napi_schedule()                   : napi schedule
> napi_task()                       : napi poll
> ath10k_pci_process_rx_cb()        : pci rx ce pipe 1 len 16
> ath10k_pci_process_rx_cb()        : pci rx: len=16
> ath10k_pci_process_rx_cb()        : 00 02 08 00 08 08 00 00 01 04 00
> 01 02 01 B4 06
> ath10k_htc_process_credit_report(): htc ep 2 got 1 credits (total 1)
> napi_complete()                   : napi complete
> napi_schedule()                   : napi schedule
> napi_task()                       : napi poll
> ath10k_pci_process_rx_cb()        : pci rx ce pipe 1 len 16
> ath10k_pci_process_rx_cb()        : pci rx: len=16
> ath10k_pci_process_rx_cb()        : 00 02 08 00 08 09 00 00 01 04 00
> 00 02 01 00 00
> ath10k_htc_process_credit_report(): htc ep 2 got 1 credits (total 2)
> napi_complete()                   : napi complete
> ath10k_htc_send()                 : htc ep 2 consumed 1 credits (total 1)
> ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x05745d64 len
> 16 n_items 1
> ath10k_pci_hif_tx_sg()            : pci tx data: len=16
> ath10k_pci_hif_tx_sg()            : 02 01 08 00 00 0A 00 00 05 90 00
> 00 E9 91 A9 0B
> napi_schedule()                   : napi schedule
> napi_task()                       : napi poll
> ath10k_pci_process_rx_cb()        : pci rx ce pipe 2 len 16
> ath10k_pci_process_rx_cb()        : pci rx: len=16
> ath10k_pci_process_rx_cb()        : 02 00 08 00 00 0A 00 00 01 90 00
> 00 E9 91 A9 0B
> ath10k_htc_rx_completion_handler(): htc rx completion ep 2 skb 0x1522e4f0K
> ath10k_wmi_event_echo()           : wmi event echo value 0x0ba991e9
> ath10k_htc_notify_tx_completion() : ath10k_htc_notify_tx_completion:
> ep 2 skb 0x14f91bb8K
> napi_complete()                   : napi complete
> napi_schedule()                   : napi schedule
> napi_task()                       : napi poll
> ath10k_pci_process_rx_cb()        : pci rx ce pipe 1 len 16
> ath10k_pci_process_rx_cb()        : pci rx: len=16
> ath10k_pci_process_rx_cb()        : 00 02 08 00 08 0B 00 00 01 04 00
> 00 02 01 00 00
> ath10k_htc_process_credit_report(): htc ep 2 got 1 credits (total 2)
> napi_complete()                   : napi complete
> ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x05745d64 len
> 12 n_items 1
> ath10k_pci_hif_tx_sg()            : pci tx data: len=12
> ath10k_pci_hif_tx_sg()            : 01 01 04 00 00 04 00 00 00 90 00 00
> napi_schedule()                   : napi schedule
> napi_task()                       : napi poll
> ath10k_pci_process_rx_cb()        : pci rx ce pipe 5 len 12
> ath10k_pci_process_rx_cb()        : pci rx: len=12
> ath10k_pci_process_rx_cb()        : 01 00 04 00 00 0C 00 00 00 02 02 00
> napi_complete()                   : napi complete
> ath10k_htt_verify_version()       : htt target version 2.2
> ath10k_htt_send_frag_desc_bank_c(): htt frag desc bank cmd
> ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x05745d64 len
> 56 n_items 1
> ath10k_pci_hif_tx_sg()            : pci tx data: len=56
> ath10k_pci_hif_tx_sg()            : 01 01 30 00 00 05 00 00 06 08 01
> 40 80 DB 26 05
> ath10k_pci_hif_tx_sg()            : 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 C3 09
> ath10k_pci_hif_tx_sg()            : 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00
> ath10k_pci_hif_tx_sg()            : 00 00 00 00 00 00 00 00
> ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x056f5b64 len
> 48 n_items 1
> ath10k_pci_hif_tx_sg()            : pci tx data: len=48
> ath10k_pci_hif_tx_sg()            : 01 01 28 00 00 06 00 00 02 01 00
> 00 E0 5A 26 05
> ath10k_pci_hif_tx_sg()            : 20 5B 26 05 00 08 80 07 FF FF FF
> 03 3B 00 4B 00
> ath10k_pci_hif_tx_sg()            : 15 00 1F 00 03 00 14 00 06 00 0A
> 00 01 00 02 00
> ath10k_htt_h2t_aggr_cfg_msg()     : htt h2t aggr cfg msg amsdu 2 ampdu 62
> ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x05745c64 len
> 11 n_items 1
> ath10k_pci_hif_tx_sg()            : pci tx data: len=11
> ath10k_pci_hif_tx_sg()            : 01 01 03 00 00 07 00 00 05 3E 02
> ath10k_wmi_op_gen_pdev_set_param(): wmi pdev set param 34 value 1
> ath10k_htc_send()                 : htc ep 2 consumed 1 credits (total 1)
> ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x056d5864 len
> 20 n_items 1
> ath10k_pci_hif_tx_sg()            : pci tx data: len=20
> ath10k_pci_hif_tx_sg()            : 02 01 0C 00 00 0B 00 00 08 90 00
> 00 22 00 00 00
> ath10k_pci_hif_tx_sg()            : 01 00 00 00
> napi_schedule()                   : napi schedule
> ath10k_wmi_op_gen_pdev_set_param(): wmi pdev set param 10 value 1
> ath10k_htc_send()                 : htc ep 2 consumed 1 credits (total 0)
> ath10k_pci_hif_tx_sg()            : pci tx item 0 paddr 0x056d5764 len
> 20 n_items 1
> ath10k_pci_hif_tx_sg()            : pci tx data: len=20
> ath10k_pci_hif_tx_sg()            : 02 01 0C 00 00 0C 00 00 08 90 00
> 00 0A 00 00 00
> ath10k_pci_hif_tx_sg()            : 01 00 00 00
> ath10k_wmi_op_gen_pdev_set_param(): wmi pdev set param 1 value 15
> napi_task()                       : napi poll
> ath10k_pci_fw_crashed_dump()      : firmware crashed! (uuid n/a)
> ath10k_pci_dump_registers()       : firmware register dump:
> ath10k_pci_dump_registers()       : [00]: 0x0000000A 0x000015B3
> 0x0A0347D6 0x00975B31
> ath10k_pci_dump_registers()       : [04]: 0x0A0347D6 0x00060930
> 0x0000000E 0x00000000
> ath10k_pci_dump_registers()       : [08]: 0x0042EAE8 0x004068D4
> 0x00000000 0x00471A40
> ath10k_pci_dump_registers()       : [12]: 0x00000009 0x00000000
> 0x00973D28 0x00973D33
> ath10k_pci_dump_registers()       : [16]: 0x0A0347D6 0x009606CA
> 0x00000000 0x00000000
> ath10k_pci_dump_registers()       : [20]: 0x409C7CEE 0x0040677C
> 0x00400000 0x00000000
> ath10k_pci_dump_registers()       : [24]: 0x809C440F 0x004067DC
> 0x004159F4 0xC09C7CEE
> ath10k_pci_dump_registers()       : [28]: 0x809B358C 0x0040680C
> 0x0042EAE8 0x004068D4
> ath10k_pci_dump_registers()       : [32]: 0x809B31B0 0x0040683C
> 0x0042713C 0x0041778C
> ath10k_pci_dump_registers()       : [36]: 0x809B320A 0x0040690C
> 0x0040697C 0x00975A00
> ath10k_pci_dump_registers()       : [40]: 0x809B2DA8 0x0040693C
> 0x00000001 0x0040697C
> ath10k_pci_dump_registers()       : [44]: 0x809B2484 0x0040695C
> 0x0042325C 0x00423280
> ath10k_pci_dump_registers()       : [48]: 0x8096EE0E 0x0040697C
> 0x00427134 0x00000001
> ath10k_pci_dump_registers()       : [52]: 0x8096F883 0x00406A2C
> 0x0042C914 0x00423938
> ath10k_pci_dump_registers()       : [56]: 0x80963A26 0x00406A4C
> 0x0042C914 0x00405528
> 
> 2017-01-09 23:17 GMT+05:00 Adrian Chadd <adrian@freebsd.org>:
> > hi,
> >
> > can you provide a dump with the wmi/mac debugging enabled? it'd be
> > useful to see the sequence of wmi messages before the crash.
> >
> >
> > -a
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
